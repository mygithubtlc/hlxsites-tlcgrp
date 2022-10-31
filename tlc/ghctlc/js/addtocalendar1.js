/// <reference path="jquery-1.10.2.js" />
/// <reference path="jquery-1.10.2.min.js" />

(function (w, d) {
    var atc_url = "//addtocalendar.com/atc/",
        atc_version = "1.5",
        b = d.documentElement;
    if (!Array.indexOf) {
        Array.prototype.indexOf = function (e) {
            for (var t = 0, n = this.length; t < n; t++) {
                if (this[t] == e) {
                    return t
                }
            }
            return -1
        }
    }
    if (!Array.prototype.map) {
        Array.prototype.map = function (e) {
            var t = [];
            for (var n = 0, r = this.length; n < r; n++) {
                t.push(e(this[n]))
            }
            return t
        }
    }
    var isArray = function (e) {
        return Object.prototype.toString.call(e) === "[object Array]"
    };
    var isFunc = function (e) {
        return Object.prototype.toString.call(e) === "[object Function]"
    };
    var ready = function (e, t) {
        function u() {
            if (!n) {
                if (!t.body) return setTimeout(u, 13);
                n = true;
                if (i) {
                    var e, r = 0;
                    while (e = i[r++]) e.call(null);
                    i = null
                }
            }
        }

        function a() {
            if (r) return;
            r = true;
            if (t.readyState === "complete") return u();
            if (t.addEventListener) {
                t.addEventListener("DOMContentLoaded", s, false);
                e.addEventListener("load", u, false)
            } else {
                if (t.attachEvent) {
                    t.attachEvent("onreadystatechange", s);
                    e.attachEvent("onload", u);
                    var n = false;
                    try {
                        n = e.frameElement == null
                    } catch (i) { }
                    if (b.doScroll && n) f()
                } else {
                    o = e.onload;
                    e.onload = function (e) {
                        o(e);
                        u()
                    }
                }
            }
        }

        function f() {
            if (n) return;
            try {
                b.doScroll("left")
            } catch (e) {
                setTimeout(f, 1);
                return
            }
            u()
        }
        var n = false,
            r = false,
            i = [],
            s, o;
        if (t.addEventListener) {
            s = function () {
                t.removeEventListener("DOMContentLoaded", s, false);
                u()
            }
        } else {
            if (t.attachEvent) {
                s = function () {
                    if (t.readyState === "complete") {
                        t.detachEvent("onreadystatechange", s);
                        u()
                    }
                }
            }
        }
        return function (e) {
            a();
            if (n) {
                e.call(null)
            } else {
                i.push(e)
            }
        }
    }(w, d);
    if (w.addtocalendar && typeof w.addtocalendar.start == "function")
        return;
    if (!w.addtocalendar)
        w.addtocalendar = {};

    addtocalendar.languages = {
        de: "In den Kalender",
        en: "",
        es: "AÃ±adir al Calendario",
        fr: "Ajouter au calendrier",
        hi: "à¤•à¥ˆà¤²à¥‡à¤‚à¤¡à¤° à¤®à¥‡à¤‚ à¤œà¥‹à¤¡à¤¼à¥‡à¤‚",
        "in": "Tambahkan ke Kalender",
        ja: "ã‚«ãƒ¬ãƒ³ãƒ€ãƒ¼ã«è¿½åŠ ",
        ko: "ìº˜ë¦°ë”ì— ì¶”ê°€",
        pt: "Adicionar ao calendÃ¡rio",
        ru: "Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð² ÐºÐ°Ð»ÐµÐ½Ð´Ð°Ñ€ÑŒ",
        uk: "Ð”Ð¾Ð´Ð°Ñ‚Ð¸ Ð² ÐºÐ°Ð»ÐµÐ½Ð´Ð°Ñ€",
        zh: "æ·»åŠ åˆ°æ—¥åŽ†"
    };

    addtocalendar.calendar_urls = {};
    addtocalendar.loadSettings = function (element) {
        var settings = {
            language: "auto",
            "show-list-on": "click",
            calendars: ["iCalendar", "Google Calendar", "Outlook", "Yahoo! Calendar"],
            secure: "auto",
            "on-button-click": function () { },
            "on-calendar-click": function () { alert("heloo")}
        };
        for (var option in settings) {
            var pname = "data-" + option;
            var eattr = element.getAttribute(pname);
            if (eattr != null) {
                if (isArray(settings[option])) {
                    settings[option] = eattr.replace(/\s*,\s*/g, ",").replace(/^\s+|\s+$/g, "").split(",");
                    continue
                }
                if (isFunc(settings[option])) {
                    var fn = window[eattr];
                    if (isFunc(fn)) {
                        settings[option] = fn
                    } else {
                        settings[option] = eval("(function(mouseEvent){" + eattr + "})")
                    }
                    continue
                }
                settings[option] = element.getAttribute(pname)
            }
        }
        return settings
    };


    addtocalendar.load = function () {

        var strValue = "";
        $(document).ready(function () {

            //brijesh 24092016
            $('a').each(function (i) {
                strValue = $(this).attr('id');
                // alert(strValue);
                //alert($(this).attr('id'));
            });
            //

        });
        ready(function () {
            var e = {
                iCalendar: "ical",
                "Google Calendar": "google",
                Outlook: "outlook",
                "Outlook Online": "outlookonline",
                "Yahoo! Calendar": "yahoo"
            };

            var t = -(new Date).getTimezoneOffset().toString();
            var n = addtocalendar.languages;
            var r = document.getElementsByTagName("*");
            for (var i = 0; i < r.length; i++) {
                var s = r[i].className;
                if (s.length && s.split(" ").indexOf("addtocalendar") != -1) {
                    var o = addtocalendar.loadSettings(r[i]);
                    var u = o["calendars"].length == 1;
                    var a = "http:";
                    if (o["secure"] == "auto") {
                        a = location.protocol == "https:" ? "https:" : "http:"
                    } else if (o["secure"] == "true") {
                        a = "https:"
                    };
                    var l = r[i].id;
                    var c = n["en"];
                    if (o["language"] == "auto") {
                        var h = "no_lang";
                        if (typeof navigator.language === "string") {
                            h = navigator.language.substr(0, 2)
                        } else if (typeof navigator.browserLanguage === "string") {
                            h = navigator.browserLanguage.substr(0, 2)
                        }
                        if (n.hasOwnProperty(h)) {
                            c = n[h]
                        }
                    } else if (n.hasOwnProperty(o["language"])) {
                        c = n[o["language"]]
                    }
                    var p = ["utz=" + t, "uln=" + navigator.language, "vjs=" + atc_version];
                    var d = r[i].getElementsByTagName("var");
                    //alert("d-" + d)
                    var v = -1;
                    for (var m = 0; m < d.length; m++) {
                        var g = d[m].className.replace("atc_", "").split(" ")[0];
                        var y = d[m].innerHTML;
                        //alert("y-" + y);
                        if (g == "event") {
                            v++;
                            continue
                        }
                        if (g == d[m].className) {

                            if (g == "atc-body") {
                                c = y
                            }
                            continue
                        }
                        if (v == -1) {
                            continue
                        }
                        p.push("e[" + v + "][" + g + "]" + "=" + encodeURIComponent(y))
                    }
                    var b = l == "" ? "" : l + "_link";
                    var w = document.createElement("ul");
                    w.className = "atcb-list";
                    //brijesh 24092016
                    w.id = "atcb1";
                    var atcb2W = document.createElement("ul");
                    atcb2W.className = "atcb-list";
                    atcb2W.id = "atcb2";
                    var atcb3W = document.createElement("ul");
                    atcb3W.className = "atcb-list";
                    atcb2W.id = "atcb3";
                    //end
                    var E = "";
                    var S = "";
                    var atcb2E = "";
                    var atcb3E = "";
                   
                    for (var x in o["calendars"]) {
                        //debugger;
                        // alert("calendars-" + o["calendars"]);
                        if (!e.hasOwnProperty(o["calendars"][x])) {
                            continue
                        } var T = e[o["calendars"][x]];

                        //alert("T-" + T);
                        //alert("l" + l);
                        // alert("T" + T);
                        var N = l == "" ? "" : 'id="' + l + "_" + T + '_link"';

                        var C = ((T == 'ical' && /iPad|iPhone|iPod/.test(navigator.userAgent) && !window.MSStream ? 'webcal:' : a) + atc_url) + T + "?" + p.join("&");
                        //alert("C-" + C)
                        if (u) {
                            S = C
                            //alert("S-" + S);
                        } else {
                            //E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="' + C + '" target="_blank">' + o["calendars"][x] + "</a></li>"


                            //Changes by Brijesh 23092016
                            if (strValue = "atcb1") {
                                if (T == "ical") {
                                    // alert("N" + N);
                                    var iCalendar = "iCalendar";
                                    E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://tlc.in/tlc/ghctlc/content/addtocalendar-1-iCal.ics" target="_blank">' + iCalendar + "</a></li>"
                                }
                                if (T == "google") {
                                    var TLCGROUP = "GOOGLE";
                                    E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://addtocalendar.com/atc/google?f=m&e[0][date_start]=2017-01-06%2019%3A30%3A00&e[0][date_end]=2017-01-06%2023%3A00%3A00&e[0][timezone]=Asia%2FKolkata&e[0][title]=GHC%202017%20-%20Cocktail%20Dinner%20hosted%20by%20The%20Oberoi%20Group&e[0][description]=GHC%202017%20-%20Cocktail%20Dinner%20hosted%20by%20The%20Oberoi%20Group&e[0][location]=The%20Oberoi%20Gurgaon&e[0][organizer]=GHC&e[0][organizer_email]=ghc%40tlcgroup.com&e[0][privacy]=public" target="_blank">' + TLCGROUP + "</a></li>"
                                }
                                if (T == "outlook") {
                                    var outlook = "OUTLOOK";
                                    E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://tlc.in/tlc/ghctlc/content/addtocalendar-1-Outlook.ics" target="_blank">' + outlook + "</a></li>"
                                }
                                if (T == "yahoo") {
                                    var YAHOO = "YAHOO";
                                    E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://addtocalendar.com/atc/yahoo?f=m&e[0][date_start]=2017-01-06%2019%3A30%3A00&e[0][date_end]=2017-01-06%2023%3A00%3A00&e[0][timezone]=Asia%2FKolkata&e[0][title]=GHC%202017%20-%20Cocktail%20Dinner%20hosted%20by%20The%20Oberoi%20Group&e[0][description]=GHC%202017%20-%20Cocktail%20Dinner%20hosted%20by%20The%20Oberoi%20Group&e[0][location]=The%20Oberoi%20Gurgaon&e[0][organizer]=GHC&e[0][organizer_email]=ghc%40tlcgroup.com&e[0][privacy]=public" target="_blank">' + YAHOO + "</a></li>"
                                }

                            }

                            if (strValue = "atcb2") {
                                //alert(idatcb2);
                                if (T == "ical") {
                                    var iCalendar = "iCalendar";
                                    atcb2E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://tlc.in/tlc/ghctlc/content/addtocalendar-2-iCal.ics" target="_blank">' + iCalendar + "</a></li>"
                                }
                                if (T == "google") {
                                    var TLCGROUP = "GOOGLE";
                                    atcb2E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href=" http://addtocalendar.com/atc/google?f=m&e[0][date_start]=2017-01-07%2010%3A00%3A00&e[0][date_end]=2017-01-07%2019%3A30%3A00&e[0][timezone]=Asia%2FKolkata&e[0][title]=GHC%202017%20-%20Day%20Conference&e[0][description]=Day%20long%20sessions%20including%20key%20note%20speakers%20and%20panel%20discussions&e[0][location]=The%20Leela%20Ambience%20Gurgaon%20Hotel%20%26%20Residences&e[0][organizer]=GHC&e[0][organizer_email]=ghc%40tlcgroup.com&e[0][privacy]=public" target="_blank">' + TLCGROUP + "</a></li>"
                                }
                                if (T == "outlook") {
                                    var outlook = "OUTLOOK";
                                    atcb2E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://tlc.in/tlc/ghctlc/content/addtocalendar-2-Outlook.ics" target="_blank">' + outlook + "</a></li>"
                                }
                                if (T == "yahoo") {
                                    var YAHOO = "YAHOO";
                                    atcb2E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://addtocalendar.com/atc/yahoo?f=m&e[0][date_start]=2017-01-07%2010%3A00%3A00&e[0][date_end]=2017-01-07%2019%3A30%3A00&e[0][timezone]=Asia%2FKolkata&e[0][title]=GHC%202017%20-%20Day%20Conference&e[0][description]=Day%20long%20sessions%20including%20key%20note%20speakers%20and%20panel%20discussions&e[0][location]=The%20Leela%20Ambience%20Gurgaon%20Hotel%20%26%20Residences&e[0][organizer]=GHC&e[0][organizer_email]=ghc%40tlcgroup.com&e[0][privacy]=public" target="_blank">' + YAHOO + "</a></li>"
                                }

                            }


                            if (strValue = "atcb3") {
                                if (T == "ical") {
                                    var iCalendar = "iCalendar";
                                    atcb3E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://tlc.in/tlc/ghctlc/content/addtocalendar-3-iCal.ics" target="_blank">' + iCalendar + "</a></li>"
                                }
                                if (T == "google") {
                                    var TLCGROUP = "GOOGLE";
                                    atcb3E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://addtocalendar.com/atc/google?f=m&e[0][date_start]=2017-01-07%2019%3A30%3A00&e[0][date_end]=2017-01-07%2023%3A00%3A00&e[0][timezone]=Asia%2FKolkata&e[0][title]=GHC%202017%20-%20Fun%20Evening%20with%20Cocktails%20and%20Dinner&e[0][description]=Fun%20Evening%20with%20Cocktails%20and%20Dinner&e[0][location]=The%20Leela%20Ambience%20Gurgaon%20Hotel%20%26%20Residences&e[0][organizer]=GHC&e[0][organizer_email]=ghc%40tlcgroup.com&e[0][privacy]=public" target="_blank">' + TLCGROUP + "</a></li>"
                                }
                                if (T == "outlook") {
                                    var outlook = "OUTLOOK";
                                    atcb3E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://tlc.in/tlc/ghctlc/content/addtocalendar-3-Outlook.ics" target="_blank">' + outlook + "</a></li>"
                                }
                                if (T == "yahoo") {
                                    var YAHOO = "YAHOO";
                                    atcb3E += '<li class="atcb-item"><a ' + N + ' class="atcb-item-link" href="http://addtocalendar.com/atc/yahoo?f=m&e[0][date_start]=2017-01-07%2019%3A30%3A00&e[0][date_end]=2017-01-07%2023%3A00%3A00&e[0][timezone]=Asia%2FKolkata&e[0][title]=GHC%202017%20-%20Fun%20Evening%20with%20Cocktails%20and%20Dinner&e[0][description]=Fun%20Evening%20with%20Cocktails%20and%20Dinner&e[0][location]=The%20Leela%20Ambience%20Gurgaon%20Hotel%20%26%20Residences&e[0][organizer]=GHC&e[0][organizer_email]=ghc%40tlcgroup.com&e[0][privacy]=public" target="_blank">' + YAHOO + "</a></li>"
                                }
                                //End
                                // alert("E-" + E);
                            }
                        }
                    }

                    w.innerHTML = E;

                    //brijesh 24092016
                    atcb2W.innerHTML = atcb2E;
                    atcb3W.innerHTML = atcb3E;
                    //end

                    //alert("E- " + E);
                    if (r[i].getElementsByClassName("atcb-link")[0] == undefined) {
                        debugger;
                        //change
                        var k = document.createElement("img");

                        k.className = "atcb-link";
                        //k.style = "background:2px solid #b89e61 !important;";
                        k.src = "http://tlcgroup.info/dashboardpromo/mvci/images/add-calender.jpg"

                       // k.innerHTML = c;
                        k.id = b;
                        k.width = 100;   
                        k.border = 0;
                        k.tabIndex = 1;
                        if (u) {
                            //k.href = S;
                            //k.target = "_blank"
                        }
                        r[i].appendChild(k);
                        if (!u) {
                            r[i].appendChild(w)
                        }
                    } else {
                        var k = r[i].getElementsByClassName("atcb-link")[0];
                        //brijesh 24092016
                        if (k.id == "atcb1") {
                            if (!u) {

                                k.parentNode.appendChild(w)

                            }
                        }
                        var k2 = r[i].getElementsByClassName("atcb-link")[0];
                        if (k2.id == "atcb2") {
                            if (!u) {

                                k2.parentNode.appendChild(atcb2W)

                            }
                        }
                        var k3 = r[i].getElementsByClassName("atcb-link")[0];
                        if (k3.id == "atcb3") {
                            if (!u) {

                                k3.parentNode.appendChild(atcb3W)

                            }
                        }
                        //end

                        k.tabIndex = 1;
                        //if (k.id == "") {
                        //    k.id = b
                        //}
                        //if (u) {
                        //    k.href = S;
                        //    k.target = "_blank"
                        //}
                    }

                    r[i].getElementsByClassName("atcb-item")[0].addEventListener("click", o["on-button-click"], false);
                    var L = r[i].getElementsByClassName("atcb-item-link");
                    //alert("R- " +r[i]);
                    for (var m = 0; m < L.length; m++) {
                        L[m].addEventListener("click", o["on-calendar-click"], false)
                        // alert("L- "+L[m]);
                    }


                }
            }
        })
    };
    addtocalendar.load()
})(window, document)