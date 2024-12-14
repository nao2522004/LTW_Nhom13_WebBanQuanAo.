const container = document.querySelector('.container');
const registerBtn = document.querySelector('.register-btn');
const loginBtn = document.querySelector('.login-btn');
const popup = document.getElementById('popup');
const popupMessage = document.getElementById('popup-message');

registerBtn.addEventListener('click' , () => {
    container.classList.add('active');
});

loginBtn.addEventListener('click' , () => {
    container.classList.remove('active');
});


function togglePassword(button) {
    const input = button.previousElementSibling;
    const icon = button.querySelector('i');

    if (input.type === "password") {
        input.type = "text"; // Hiện mật khẩu
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        input.type = "password"; // Ẩn mật khẩu
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}

