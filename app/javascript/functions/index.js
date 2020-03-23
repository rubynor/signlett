
export function makeRecipientArray(recipients, document){
    let recipientCompared = []
    for(let i = 0; i < recipients.length; i++) {
        for (let j = 0; j < recipients.length; j++)
            if (recipients[i].id === recipients[j].id) {
                continue
            } else if (recipients[i].document.id === recipients[j].document.id && recipients[i].document.id === document.id) {
                recipientCompared.push(recipients[i].id)
                break;
            } else if(recipients[i].document.id === document.id){
                recipientCompared.push(recipients[i].id)
                break;
            }
    }
    return recipientCompared
}
