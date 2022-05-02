let form = document.querySelector('form')
let respuesta = document.querySelector('.respuesta')

form.addEventListener('submit', evt =>{
  evt.preventDefault()
  const xhr = new XMLHttpRequest()
  const formData = new FormData(form)

  xhr.open('POST', 'inc/login.php', true)

  xhr.addEventListener('load', e =>{
    if(e.target.readyState == 4 && e.target.status == 200){
      if(e.target.response == 'ok'){
        document.location.href = 'home.php'
      }else{
        respuesta.innerHTML = e.target.response
      }
    }
  })
  xhr.send(formData)
})
