(this.webpackJsonpclient=this.webpackJsonpclient||[]).push([[18],{416:function(e,t,a){"use strict";var l=a(0),n=a(112);t.a=Object(n.a)(l.default.createElement("path",{d:"M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"}),"ArrowBack")},480:function(e,t,a){},495:function(e,t,a){"use strict";a.r(t);var l=a(11),n=a.n(l),c=a(19),r=a(9),d=a(27),i=a(14),u=a(0),m=(a(480),a(397)),s=a(396),o=a(400),f=a(416),h=a(112),b=Object(h.a)(u.default.createElement("path",{d:"M20 8.69V4h-4.69L12 .69 8.69 4H4v4.69L.69 12 4 15.31V20h4.69L12 23.31 15.31 20H20v-4.69L23.31 12 20 8.69zM12 18c-.89 0-1.74-.2-2.5-.55C11.56 16.5 13 14.42 13 12s-1.44-4.5-3.5-5.45C10.26 6.2 11.11 6 12 6c3.31 0 6 2.69 6 6s-2.69 6-6 6z"}),"Brightness4"),E=Object(h.a)(u.default.createElement("path",{d:"M21 3H3c-1.1 0-2 .9-2 2v3h2V5h18v14h-7v2h7c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2zM1 18v3h3c0-1.66-1.34-3-3-3zm0-4v2c2.76 0 5 2.24 5 5h2c0-3.87-3.13-7-7-7zm0-4v2c4.97 0 9 4.03 9 9h2c0-6.08-4.93-11-11-11z"}),"Cast"),v=Object(h.a)(u.default.createElement("path",{d:"M20 5H4c-1.1 0-1.99.9-1.99 2L2 17c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm-9 3h2v2h-2V8zm0 3h2v2h-2v-2zM8 8h2v2H8V8zm0 3h2v2H8v-2zm-1 2H5v-2h2v2zm0-3H5V8h2v2zm9 7H8v-2h8v2zm0-4h-2v-2h2v2zm0-3h-2V8h2v2zm3 3h-2v-2h2v2zm0-3h-2V8h2v2z"}),"Keyboard"),g=Object(h.a)(u.default.createElement("path",{d:"M13 2.05v3.03c3.39.49 6 3.39 6 6.92 0 .9-.18 1.75-.48 2.54l2.6 1.53c.56-1.24.88-2.62.88-4.07 0-5.18-3.95-9.45-9-9.95zM12 19c-3.87 0-7-3.13-7-7 0-3.53 2.61-6.43 6-6.92V2.05c-5.06.5-9 4.76-9 9.95 0 5.52 4.47 10 9.99 10 3.31 0 6.24-1.61 8.06-4.09l-2.6-1.53C16.17 17.98 14.21 19 12 19z"}),"DataUsage"),p=Object(h.a)(u.default.createElement("path",{d:"M2 20h20v-4H2v4zm2-3h2v2H4v-2zM2 4v4h20V4H2zm4 3H4V5h2v2zm-4 7h20v-4H2v4zm2-3h2v2H4v-2z"}),"Storage"),y=a(354),O=a(393),w=a(395),k=a(408),j=a(388),z=a(277),S=a(20),C=a(210),H=a(276),I=a(379),M=a(401),N=a(192),V=a(31),D=a(97),L=a(25),x=a(30),J=function(){var e=u.default.useState({darkmode:null!==localStorage.getItem(S.a.darkMode)&&JSON.parse(localStorage.getItem(S.a.darkMode)),keyboard:null!==localStorage.getItem(S.a.onScreenKeyboard)&&JSON.parse(localStorage.getItem(S.a.onScreenKeyboard)),casting:null!==localStorage.getItem(S.a.castEnabled)&&JSON.parse(localStorage.getItem(S.a.castEnabled)),litemode:null!==localStorage.getItem(S.a.litemode)&&JSON.parse(localStorage.getItem(S.a.litemode))}),t=Object(i.a)(e,2),a=t[0],l=t[1],h=Object(L.e)(),J=Object(C.useDialog)(),P=function(e,t){return l(Object(d.a)(Object(d.a)({},a),{},Object(r.a)({},e,t)))},K=u.default.useContext(V.s),A=Object(i.a)(K,2),B=A[0],T=A[1],W=u.default.useContext(V.c).account;return u.default.useEffect((function(){W||(window.location.href="/LOGIN?prompt=password")}),[]),u.default.createElement("div",{className:"Settings"},u.default.createElement(y.a,{className:"mt-5 text-left"},u.default.createElement("div",{style:{display:"inline-flex",justifyContent:"center"},className:"w-100 mt-5"},u.default.createElement(N.a,null,W?u.default.createElement(k.a,{style:{width:"4rem",height:"4rem"},alt:W.username,src:W.picture}):null)),u.default.createElement(I.a,{className:"bg-transparent",elevation:0},u.default.createElement(M.a,null,u.default.createElement(N.a,{onClick:function(){return h.goBack()},edge:"start","aria-label":"menu"},u.default.createElement(f.a,null)))),u.default.createElement("div",{className:"text-center"},u.default.createElement(m.a,{id:"switch-list-label-wifi",primary:W?W.username:"",secondary:W?W.email:""}))),u.default.createElement(y.a,null,u.default.createElement(j.a,null),u.default.createElement(O.a,null,u.default.createElement(w.a,null,u.default.createElement(b,null)),u.default.createElement(m.a,{id:"switch-list-label-wifi",primary:"Dark Mode",secondary:"Enable Dark Theme"}),u.default.createElement(s.a,null,u.default.createElement(o.a,{edge:"end",onChange:function(){T(!B),P("darkmode",!a.darkmode)},checked:a.darkmode,inputProps:{"aria-labelledby":"switch-list-label-wifi"}}))),u.default.createElement(O.a,null,u.default.createElement(w.a,null,u.default.createElement(E,null)),u.default.createElement(m.a,{id:"switch-list-label-wifi",primary:"Song Casting",secondary:"Remote Play songs on connected devices"}),u.default.createElement(s.a,null,u.default.createElement(o.a,{edge:"end",onChange:function(e){localStorage.setItem(S.a.castEnabled,!a.casting),P("casting",!a.casting)},checked:a.casting,inputProps:{"aria-labelledby":"switch-list-label-wifi"}}))),u.default.createElement(O.a,null,u.default.createElement(w.a,null,u.default.createElement(v,null)),u.default.createElement(m.a,{id:"switch-list-label-wifi",primary:"On-screen Keyboard",secondary:"On Screen keyboard for TV devices"}),u.default.createElement(s.a,null,u.default.createElement(o.a,{edge:"end",onChange:function(e){localStorage.setItem(S.a.onScreenKeyboard,!a.keyboard),P("keyboard",!a.keyboard)},checked:a.keyboard,inputProps:{"aria-labelledby":"switch-list-label-wifi"}}))),u.default.createElement(O.a,null,u.default.createElement(w.a,null,u.default.createElement(g,null)),u.default.createElement(m.a,{id:"switch-list-label-wifi",primary:"Lite Mode",secondary:"Cache results to save data"}),u.default.createElement(s.a,null,u.default.createElement(o.a,{edge:"end",onChange:function(e){localStorage.setItem(S.a.litemode,!a.litemode),P("litemode",!a.litemode)},checked:a.litemode,inputProps:{"aria-labelledby":"switch-list-label-wifi"}}))),u.default.createElement(O.a,{button:!0,onClick:Object(c.a)(n.a.mark((function e(){return n.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:Object(x.a)(S.a.home.saveObject),Object(x.a)(S.a.home.timeObject),Object(x.a)(S.a.discover.saveObject),Object(x.a)(S.a.discover.timeObject),Object(x.a)(S.a.trendingArtists.saveObject),Object(x.a)(S.a.trendingArtists.timeObject);case 6:case"end":return e.stop()}}),e)})))},u.default.createElement(w.a,null,u.default.createElement(p,null)),u.default.createElement(m.a,{id:"switch-list-label-wifi",primary:"Clear Cache",secondary:"Delete Cached Data"})),u.default.createElement(j.a,null),u.default.createElement(O.a,null,u.default.createElement(m.a,{id:"switch-list-label-bluetooth",primary:"Feedback and Help",secondary:"Send feedback or report a bug"}),u.default.createElement(s.a,null,u.default.createElement(z.b,null))),u.default.createElement(O.a,{button:!0,onClick:function(){var e={title:u.default.createElement(y.a,{className:"p-0 m-0"},u.default.createElement(O.a,{className:"p-0 m-0"},u.default.createElement(m.a,{className:"p-0 m-0",primary:"Device Cast Id",secondary:"This Will be used when casting to this device"}))),message:u.default.createElement(H.a,{disabled:!0,variant:"filled",value:D.a.getId()})||"Nothing Here!"};J.alert(e)}},u.default.createElement(m.a,{primary:"Device ID",secondary:"Device Id When Casting"}),u.default.createElement(s.a,null,u.default.createElement(E,null)))))};J.defaultProps={};t.default=u.default.memo(J)}}]);
//# sourceMappingURL=18.96942a09.chunk.js.map