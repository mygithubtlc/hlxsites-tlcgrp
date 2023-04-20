import { loadCSS } from '../../scripts/scripts.js';

const SITE_KEY = '6LdYzWMjAAAAAJZw3YBaRxqtskr9sNSkXg1gPGTU';

function loadScript(url, callback, container = document.querySelector('head')) {
  let script = container.querySelector(`script[src="${url}"]`);
  if (!script) {
    script = document.createElement('script');
    script.src = url;
    script.async = true;
    container.append(script);
    script.onload = callback;
    return script;
  }
  return script;
}

function createSelect(fd) {
  const select = document.createElement('select');
  select.id = fd.Field;
  if (fd.Placeholder) {
    const ph = document.createElement('option');
    ph.textContent = fd.Placeholder;
    ph.setAttribute('selected', '');
    ph.setAttribute('disabled', '');
    select.append(ph);
  }
  fd.Options.split(',').forEach((o) => {
    const option = document.createElement('option');
    option.textContent = o.trim();
    option.value = o.trim();
    select.append(option);
  });
  if (fd.Mandatory === 'x') {
    select.setAttribute('required', 'required');
  }
  return select;
}

function constructPayload(form) {
  const payload = {};
  [...form.elements].forEach((fe) => {
    if (fe.type === 'checkbox') {
      if (fe.checked) payload[fe.id] = fe.value;
    } else if (fe.name) {
      payload[fe.name] = fe.value;
    }
  });
  return payload;
}

async function submitForm(form) {
  const payload = constructPayload(form);
  const resp = await fetch(form.dataset.action, {
    method: 'POST',
    cache: 'no-cache',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ data: payload }),
  });
  if (resp.ok) {
    await resp.text();
    return payload;
  }
  return null;
}

async function prepareFormSubmit() {
  const form = document.querySelector('form');
  const button = form.querySelector('button');
  if (form.checkValidity()) {
    if (await submitForm(form)) {
      button.setAttribute('disabled', '');
      const redirectTo = button.dataset.redirect;
      if (redirectTo) {
        window.location.href = redirectTo;
      }
    } else {
      // eslint-disable-next-line no-alert
      alert('Form submission failed');
    }
  } else {
    [...form.elements].forEach((elem) => {
      if (elem.checkValidity()) {
        elem.classList.remove('invalid');
      } else {
        elem.classList.add('invalid');
      }
    });
  }
}

window.handleRecaptchaResponse = async (token) => {
  if (token) {
    document.getElementById('g-recaptcha-response').textContent = token;
  }
};

const radioInput = document.createElement('input');
radioInput.setAttribute('type', 'radio');

function createButton(fd) {
  const button = document.createElement('button');
  button.textContent = fd.Label;
  if (fd.Type === 'submit') {
    button.classList.add('button', 'g-recaptcha');
    button.dataset.sitekey = SITE_KEY;
    button.dataset.callback = 'handleRecaptchaResponse';
    button.dataset.action = 'submit';
    button.dataset.redirect = fd.Extra || '';
    button.addEventListener('click', prepareFormSubmit);
    const obs = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          loadScript('https://www.google.com/recaptcha/api.js');
          obs.disconnect();
        }
      });
    });
    obs.observe(button);
  }
  return button;
}

function createHeading(fd) {
  const heading = document.createElement('h3');
  heading.textContent = fd.Label;
  return heading;
}

function createInput(fd) {
  const input = document.createElement('input');
  input.type = fd.Type;
  input.id = fd.Field;
  input.name = fd.Field;
  input.setAttribute('placeholder', fd.Placeholder);
  input.setAttribute('maxlength', fd.maxLength);
  input.setAttribute('onkeypress', fd.Extra);

  if (fd.Mandatory === 'x') {
    input.setAttribute('required', 'required');
  }
  return input;
}

function createTextArea(fd) {
  const input = document.createElement('textarea');
  input.id = fd.Field;
  input.name = fd.Field;
  input.setAttribute('placeholder', fd.Placeholder);
  input.setAttribute('maxlength', fd.Options);
  if (fd.Mandatory === 'x') {
    input.setAttribute('required', 'required');
  }
  return input;
}

function createTel(fd) {
  const tel = createInput(fd);
  const obs = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        loadCSS('https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/css/intlTelInput.css');
        loadScript(
          'https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/intlTelInput.min.js',
          () => {
            window.intlTelInput(tel, {
              preferredCountries: ['in'],
              utilsScript:
                'https://cdnjs.cloudflare.com/ajax/libs/intl-tel-input/17.0.8/js/utils.js',
            });
          },
        );
        obs.disconnect();
      }
    });
  });
  obs.observe(tel);
  return tel;
}

function createLabel(fd) {
  const label = document.createElement('label');
  label.setAttribute('for', fd.Field);
  label.textContent = fd.Label;
  if (fd.Mandatory === 'x') {
    label.classList.add('required');
  }
  if (fd.LabelLinks) {
    const links = JSON.parse(fd.LabelLinks);
    Object.keys(links).forEach((key) => {
      const link = `<a href="${links[key]}" target="_blank">${key}</a>`;
      label.innerHTML = label.innerHTML.replace(key, link);
    });
  }
  return label;
}

function applyRules(form, rules) {
  const payload = constructPayload(form);
  rules.forEach((field) => {
    const { type, condition: { key, operator, value } } = field.rule;
    if (type === 'visible') {
      if (operator === 'eq') {
        if (payload[key] === value) {
          form.querySelector(`.${field.fieldId}`).classList.remove('hidden');
        } else {
          form.querySelector(`.${field.fieldId}`).classList.add('hidden');
        }
      }
    }
  });
}

async function createForm(formURL) {
  const { pathname } = new URL(formURL);
  const resp = await fetch(pathname);
  const json = await resp.json();
  const form = document.createElement('form');
  const rules = [];
  // eslint-disable-next-line prefer-destructuring
  form.dataset.action = pathname.split('.json')[0];
  json.data.forEach((fd) => {
    fd.Type = fd.Type || 'text';
    const fieldWrapper = document.createElement('div');
    const style = fd.Style ? ` form-${fd.Style}` : '';
    const fieldId = `form-${fd.Field}-wrapper${style}`;
    fieldWrapper.className = fieldId;
    fieldWrapper.classList.add('field-wrapper');
    switch (fd.Type) {
      case 'select':
        fieldWrapper.append(createLabel(fd));
        fieldWrapper.append(createSelect(fd));
        break;
      case 'heading':
        fieldWrapper.append(createHeading(fd));
        break;
      case 'checkbox':
        fieldWrapper.append(createInput(fd));
        fieldWrapper.append(createLabel(fd));
        break;
      case 'text-area':
        fieldWrapper.append(createLabel(fd));
        fieldWrapper.append(createTextArea(fd));
        break;
      case 'tel':
        fieldWrapper.append(createLabel(fd));
        fieldWrapper.append(createTel(fd));
        break;
      case 'submit':
        fieldWrapper.append(createButton(fd));
        break;
      default:
        fieldWrapper.append(createLabel(fd));
        fieldWrapper.append(createInput(fd));
    }

    if (fd.Rules) {
      try {
        rules.push({ fieldId, rule: JSON.parse(fd.Rules) });
      } catch (e) {
        // eslint-disable-next-line no-console
        console.warn(`Invalid Rule ${fd.Rules}: ${e}`);
      }
    }
    form.append(fieldWrapper);
  });

  form.addEventListener('change', () => applyRules(form, rules));
  applyRules(form, rules);

  return (form);
}

export default async function decorate(block) {
  const form = block.querySelector('a[href$=".json"]');
  if (form) {
    form.replaceWith(await createForm(form.href));
  }
}
