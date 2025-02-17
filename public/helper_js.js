

// HelperJS custom lib
// for enabling UI btns etc.



// enable_btn
// toggles 'inactive_btn' button or input[type="submit"] on given id 'btn_id'
export function enable_btn(btn_id) {
   const btn = document.getElementById(btn_id)
   if(btn) {
      btn.classList.remove('inactive_btn')
   }
}

// fade_out
export function fade_out(elem_id) {
   const elem = document.getElementById(elem_id)
   if(elem) {
      elem.classList.toggle('fade_out')
   }
}


export default function() {
   
}