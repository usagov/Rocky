/* Floatbox v4.01 */
fb.extend(fb.proto,{cW:function(g){var o=fb;if(!(o&&o.fbBox&&o.currentItem)){return}var m=o.getDisplaySize(),l=o.getScroll();for(var c=0;c<fb.instances.length;c++){var f=fb.instances[c];if(!(f&&f.currentItem)||f.bs!==f.currentItem){return}var h=f.fbBox.offsetLeft-f.cornerRadius-l.left,j=o.ad.width-f.fbBox.offsetWidth-2*f.cornerRadius-h,b=f.fbBox.offsetTop-f.cornerRadius-l.top,a=o.ad.height-f.fbBox.offsetHeight-2*f.cornerRadius-b;if(f.bC===false){var d=f.fbBox.offsetWidth+2*f.cornerRadius,k=f.fbBox.offsetHeight+2*f.cornerRadius;f.bC=f.dU=0.5;if(h>=0&&j>=0&&d<=m.width&&d<=o.ad.width&&!(h===f.autoFitSpace&&j===(f.shadowSize||f.autoFitSpace))){f.bC=h/(h+j)}if(b>=0&&a>=0&&k<=m.height&&k<=o.ad.height&&!(b===f.autoFitSpace&&a===(f.shadowSize||f.autoFitSpace))){f.dU=b/(b+a)}}var p=m.width-o.ad.width,n=m.height-o.ad.height;if(h>=0&&j<0&&p>0){p=0}if(b>=0&&a<0&&n>0){n=0}if(p){f.fbBox.style.left=(f.cG.fbBox.left=o.bP(f.fbBox.offsetLeft+p*f.bC))+"px"}if(n){f.fbBox.style.top=(f.cG.fbBox.top=o.bP(f.fbBox.offsetTop+n*f.dU))+"px"}}o.ad.width=m.width;o.ad.height=m.height}});if(fb.centerOnResize&&fb.fbBox&&!fb.cX){fb.addEvent(window,"resize",fb.cW,true);fb.cX=true};