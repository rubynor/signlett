export function getCsrfToken() {
    return document.getElementsByName('csrf-token')[0].content;
}

export function logout() {
    fetch('/users/sign_out',{
        method: 'DELETE',
        headers: {
            'X-CSRF-Token': document.getElementsByName('csrf-token')[0].content,
        }
    }).then(() => document.location.reload())
}