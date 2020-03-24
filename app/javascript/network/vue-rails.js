export function getCsrfToken() {
    return document.getElementsByName('csrf-token')[0].content;
}

// Logout function
export function logout() {
    fetch('/users/sign_out',{
        method: 'DELETE',
        headers: {
            'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content,
        }
    }).then(() => document.location.reload())
}

// Function for capitalization
export function capitalize(s) {
    if(typeof s !== 'string') return '';
    return s.charAt(0).toUpperCase() + s.slice(1)
}