const handleRequest = async (eventReq, env) => {
  let json;
  if (eventReq.method === 'POST') {
    try {
      // check for recaptcha token
      json = await eventReq.json();
      const token = json.data && json.data['g-recaptcha-response'];
      if (!token) {
        // recaptcha token missing
        return new Response('', {
          status: 403,
          headers: {
            'x-error': 'Missing captcha token',
          },
        });
      } else {
        // Validate the token by calling the
        // "/siteverify" API endpoint.
        const formData = new FormData();
        formData.append('secret', env.SECRET_KEY);
        formData.append('response', token);

        const result = await fetch('https://www.google.com/recaptcha/api/siteverify', {
          body: formData,
          method: 'POST',
        });

        const outcome = await result.json();
        if (!outcome.success) {
          // recaptcha token verification failed
          console.error('Invalid captcha token provided');
          // temporarily disabled error handling
          return new Response('', {
            status: 403,
            headers: {
              'x-error': 'Invalid captcha token provided',
            },
          });
        }
      }
    } catch (e) {
      console.error(e);
      return new Response('', {
        status: 500,
        headers: {
          'x-error': e.message,
        },
      });
    }
  }
  const url = new URL(eventReq.url);
  url.hostname = env.ORIGIN_HOSTNAME;
  let backendReq;
  if (json) {
    backendReq = new Request(url, {
      headers: eventReq.headers,
      method: 'POST',
      body: JSON.stringify(json),
    });
  } else {
    backendReq = new Request(url, eventReq);
  }
  backendReq.headers.set('x-forwarded-host', eventReq.headers.get('host'));
  backendReq.headers.set('x-byo-cdn-type', 'cloudflare');
  // TODO: set the following header if push invalidation is configured
  // (see https://www.hlx.live/docs/setup-byo-cdn-push-invalidation#cloudflare)
  backendReq.headers.set('x-push-invalidation', 'enabled');
  backendReq.headers.set('x-frame-options', 'deny');
  const backendResp = await fetch(backendReq, {
    cf: {
      // cf doesn't cache html by default: need to override the default behavior
      cacheEverything: true,
    },
  });
  const resp = new Response(backendResp.body, backendResp);
  resp.headers.delete('age');
  resp.headers.delete('x-robots-tag');
  return resp;
};
export default {
  fetch: handleRequest,
};
