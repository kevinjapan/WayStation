

// HelperJS custom lib
// for enabling UI btns etc.



// enable_btn
// toggles 'inactive_btn' button or input[type="submit"] on given id 'btn_id'
export function enable_btn(btn_id) {
   const btn = document.getElementById(btn_id)
   if(btn) {
      btn.classList.toggle('inactive_btn')
   }
}

export default function() {
   
}