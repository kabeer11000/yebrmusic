(this.webpackJsonpclient=this.webpackJsonpclient||[]).push([[12],{416:function(e,t,n){"use strict";var a=n(0),r=n(112);t.a=Object(r.a)(a.default.createElement("path",{d:"M20 11H7.83l5.59-5.59L12 4l-8 8 8 8 1.41-1.41L7.83 13H20v-2z"}),"ArrowBack")},418:function(e,t,n){"use strict";n.d(t,"b",(function(){return s})),n.d(t,"a",(function(){return d}));var a=n(11),r=n.n(a),l=n(19),i=n(33),c=n(24);n(218);function o(e){return u.apply(this,arguments)}function u(){return(u=Object(l.a)(r.a.mark((function e(t){var n,a,l,i,c,u,s,d;return r.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:if(n={},1===t.nodeType){if(t.attributes.length>0)for(n.attributes={},a=0;a<t.attributes.length;a++)l=t.attributes.item(a),n.attributes[l.nodeName]=l.nodeValue}else 3===t.nodeType&&(n=t.nodeValue);if(i=[].slice.call(t.childNodes).filter((function(e){return 3===e.nodeType})),!t.hasChildNodes()||t.childNodes.length!==i.length){e.next=7;break}n=[].slice.call(t.childNodes).reduce((function(e,t){return e+t.nodeValue}),""),e.next=27;break;case 7:if(!t.hasChildNodes()){e.next=27;break}c=0;case 9:if(!(c<t.childNodes.length)){e.next=27;break}if(u=t.childNodes.item(c),s=u.nodeName,"undefined"!=typeof n[s]){e.next=18;break}return e.next=15,o(u);case 15:n[s]=e.sent,e.next=24;break;case 18:return"undefined"==typeof n[s].push&&(d=n[s],n[s]=[],n[s].push(d)),e.t0=n[s],e.next=22,o(u);case 22:e.t1=e.sent,e.t0.push.call(e.t0,e.t1);case 24:c++,e.next=9;break;case 27:return e.abrupt("return",n);case 28:case"end":return e.stop()}}),e)})))).apply(this,arguments)}var s=function(){var e=Object(l.a)(r.a.mark((function e(t){var n,a;return r.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return e.next=2,c.a.fetchText(i.a.getSuggestionFake(t));case 2:return n=e.sent,e.next=5,o((new DOMParser).parseFromString(n.toString(),"text/xml"));case 5:return a=e.sent,e.abrupt("return",a.toplevel?a.toplevel.CompleteSuggestion:[]);case 7:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}(),d=function(){var e=Object(l.a)(r.a.mark((function e(t){var n;return r.a.wrap((function(e){for(;;)switch(e.prev=e.next){case 0:return n=window.__kn.music.serviceLoginToken,e.next=3,c.a.fetch(i.a.searchYoutube(t),{headers:{"Content-Type":"application/x-www-form-urlencoded",Authorization:"Bearer ".concat(n)}});case 3:return e.abrupt("return",e.sent);case 4:case"end":return e.stop()}}),e)})));return function(t){return e.apply(this,arguments)}}()},427:function(e,t,n){},479:function(e,t,n){},502:function(e,t,n){"use strict";n.r(t);var a=n(11),r=n.n(a),l=n(27),i=n(19),c=n(14),o=n(0),u=(n(427),n(270)),s=n(379),d=n(401),f=n(192),m=n(416),p=n(292),h=n(418),b=n(393),g=n(395),v=n(397),y=n(412),x=n.n(y),E=n(25),w=n(114),k=n(408),O=n(150),j=(n(293),n(15)),C=(n(479),n(354)),N=n(394),L=n(1),S=n(3),R=n(2),T=(n(5),n(8)),P=n(4),F=o.forwardRef((function(e,t){var n=e.animation,a=void 0===n?"pulse":n,r=e.classes,l=e.className,i=e.component,c=void 0===i?"span":i,u=e.height,s=e.variant,d=void 0===s?"text":s,f=e.width,m=Object(S.a)(e,["animation","classes","className","component","height","variant","width"]),p=Boolean(m.children);return o.createElement(c,Object(L.a)({ref:t,className:Object(R.a)(r.root,r[d],l,p&&[r.withChildren,!f&&r.fitContent,!u&&r.heightAuto],!1!==a&&r[a])},m,{style:Object(L.a)({width:f,height:u},m.style)}))})),A=Object(P.a)((function(e){return{root:{display:"block",backgroundColor:Object(T.d)(e.palette.text.primary,"light"===e.palette.type?.11:.13),height:"1.2em"},text:{marginTop:0,marginBottom:0,height:"auto",transformOrigin:"0 60%",transform:"scale(1, 0.60)",borderRadius:e.shape.borderRadius,"&:empty:before":{content:'"\\00a0"'}},rect:{},circle:{borderRadius:"50%"},pulse:{animation:"$pulse 1.5s ease-in-out 0.5s infinite"},"@keyframes pulse":{"0%":{opacity:1},"50%":{opacity:.4},"100%":{opacity:1}},wave:{position:"relative",overflow:"hidden","&::after":{animation:"$wave 1.6s linear 0.5s infinite",background:"linear-gradient(90deg, transparent, ".concat(e.palette.action.hover,", transparent)"),content:'""',position:"absolute",transform:"translateX(-100%)",bottom:0,left:0,right:0,top:0}},"@keyframes wave":{"0%":{transform:"translateX(-100%)"},"60%":{transform:"translateX(100%)"},"100%":{transform:"translateX(100%)"}},withChildren:{"& > *":{visibility:"hidden"}},fitContent:{maxWidth:"fit-content"},heightAuto:{height:"auto"}}}),{name:"MuiSkeleton"})(F),B=n(211),I=function(){var e=arguments.length>0&&void 0!==arguments[0]?arguments[0]:8;return o.default.createElement(C.a,null,Object(j.a)(Array(e.length)).map((function(e){return o.default.createElement(b.a,{alignItems:"flex-start"},o.default.createElement(N.a,null,o.default.createElement(A,{variant:"circle",style:{height:"2.5rem",width:"2.5rem"}})),o.default.createElement(v.a,{primary:o.default.createElement(A,null),secondary:o.default.createElement(A,{width:"100%"})}))})))};I.defaultProps={};var M=Object(B.a)(I),U=n(388),X=n(31),z=n(216),D=n(116),V=n(42),Y=x()((function(e){return{root:{marginTop:"1rem",padding:"2px 4px",display:"flex",alignItems:"center",width:"100%"},input:{marginLeft:e.spacing(1),flex:1},iconButton:{padding:10},divider:{height:28,margin:4}}})),q=function(){var e=Object(E.e)(),t=Y(),n=o.default.useState(!0),a=Object(c.a)(n,2),y=a[0],x=a[1],j=o.default.useState(null),C=Object(c.a)(j,2),N=C[0],L=C[1],S=o.default.useContext(X.l).PlaySong,R=new AbortController,T=o.default.useContext(X.q),P=Object(c.a)(T,1)[0],F=Object(D.a)();return o.default.useEffect((function(){return P?(z.a.addSearch(P),navigator.onLine?Object(h.a)(P,R).then(L):Object(O.b)(P).then((function(e){L({accounts:[],etag:"b78bc54f-dd76-4ed9-ae0e-fab7e11a5336",items:e,kind:"KabeersMusic#searchListResponse",pageInfo:{totalResults:e.length},regionCode:"PK",title:P}),Object(V.b)(e)})),function(){return R.abort()}):e.push("/search")}),[F]),o.default.createElement("div",{className:"SearchResultComponent"},o.default.createElement(u.a,{fullScreen:!0,open:y},o.default.createElement(s.a,{className:"fixed-top"},o.default.createElement(d.a,{component:w.b,to:"/search?q=".concat(P),style:{textDecoration:"none"}},window.history?o.default.createElement(f.a,{onClick:function(){return x(!1)},component:w.b,style:{textDecoration:"none"},to:"/home",color:"primary.light",visibility:!1},o.default.createElement(m.a,null)):null,o.default.createElement(p.a,{autoCapitalize:!0,autoComplete:!0,value:P,className:"".concat(t.input," text-light"),placeholder:"Search Yebr",inputProps:{"aria-label":"Search Yebr"}}))),o.default.createElement("div",{className:"container px-3",style:{marginTop:"4rem"}},o.default.createElement("div",{className:"row"},N&&N.items?o.default.createElement(o.default.Fragment,null,N.accounts.length?o.default.createElement(o.default.Fragment,null,N.accounts.map((function(e,t){return o.default.createElement(b.a,{component:w.b,button:!0,key:t,to:"/artist/".concat(e.url.split("/").slice(-1)[0])},o.default.createElement(g.a,null,o.default.createElement(k.a,{alt:e.title,src:e.image})),o.default.createElement(v.a,{primary:"".concat(e.title),secondary:e.subCountLabel?"".concat(e.subCountLabel," Listeners"):""}))})),o.default.createElement(U.a,null)):null,N.items.length?o.default.createElement(o.default.Fragment,null,N.items.map((function(e,t){return o.default.createElement(b.a,{button:!0,key:t,onClick:Object(i.a)(r.a.mark((function n(){return r.a.wrap((function(n){for(;;)switch(n.prev=n.next){case 0:if(console.log(N.items.map((function(e){return e.item}))),F){n.next=3;break}return n.abrupt("return",S({useProxy:!1,songURI:URL.createObjectURL(e.item.blobs.audio),song:e.item,others:{offline:!0},playList:{index:t,list:Object(l.a)(Object(l.a)({},N),{},{items:N.items.map((function(e){return e.item}))})}}));case 3:return n.t0=S,n.next=6,Object(O.e)(e.id);case 6:return n.t1=n.sent,n.t2=e,n.t3={list:N,index:t},n.t4={useProxy:!0,songURI:n.t1,song:n.t2,playList:n.t3},n.abrupt("return",(0,n.t0)(n.t4));case 11:case"end":return n.stop()}}),n)})))},F?o.default.createElement(o.default.Fragment,null,o.default.createElement(g.a,null,o.default.createElement(k.a,{alt:e.snippet.title,src:e.snippet.thumbnails.high.url})),o.default.createElement(v.a,{primary:"".concat(e.snippet.title),secondary:"".concat(e.snippet.channelTitle)})):o.default.createElement(o.default.Fragment,null,o.default.createElement(g.a,null,o.default.createElement(k.a,{alt:e.item.videoElement.snippet.title,src:e.item.videoElement.snippet.thumbnails.high.url})),o.default.createElement(v.a,{primary:"".concat(e.item.videoElement.snippet.title),secondary:"".concat(e.item.videoElement.snippet.channelTitle)})))}))):null):o.default.createElement(M,{length:10})))))};q.defaultProps={};t.default=o.default.memo(q)}}]);
//# sourceMappingURL=12.b76fbe58.chunk.js.map