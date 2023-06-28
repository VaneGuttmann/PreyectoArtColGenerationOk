const signupForm = document.querySelector('#signupForm');
signupForm.addEventListener('submit', (e) => {
    e.preventDefault();

    const nameInput = document.querySelector('#name');
    const emailInput = document.querySelector('#email');
    const passwordInput = document.querySelector('#password');
    const password2Input = document.querySelector('#password2');

    const name = nameInput.value.trim();
    const email = emailInput.value.trim();
    const password = passwordInput.value.trim(); 
    const password2 = password2Input.value.trim();

    if (name === '') {
        errorForm(nameInput, 'El campo es obligatorio');
        console.log("Este");
    } else {
        exictoForm(nameInput);
    }

    if (email === '') {
        errorForm(emailInput, 'El campo es obligatorio');
    // } else if (!email(email)) {
    //     errorForm(emailInput, 'El campo no es valido');
    } else {
        exictoForm(emailInput);
    }

    if (password === '') {
        errorForm(passwordInput, 'El campo es obligatorio');
    } else {
        exictoForm(passwordInput);
    }

    if (password2 === '') {
        errorForm(password2Input, 'El campo es obligatorio');
    } else if (password !== password2) {
        errorForm(password2Input, 'Contraseñas no coinciden');
    } else {
        exictoForm(password2Input);
        const Users = JSON.parse(localStorage.getItem('users')) || [];
        const isUserRegistered = Users.find(user => user.email === email);

        if(isUserRegistered){
            return alert('El usuario ya esta registado!');
        }
    
        Users.push({name: name, email: email, password: password});
        localStorage.setItem('users', JSON.stringify(Users));
        alert('Registro Exitoso!');
        window.location.href = 'login.html';
    }
});


function errorForm(input, message) {
    const form = input.parentElement;
    const span = form.querySelector("span");
    form.className = 'form-control error';
    span.textContent = message;
}

function exictoForm(input) {
    const form = input.parentElement;
    form.className = 'form-control exito';
}

function email(email) {
    return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}