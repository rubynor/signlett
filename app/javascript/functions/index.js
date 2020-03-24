
export function makeRecipientArray(recipients, document){
    let recipientCompared = []
    for(let i = 0; i < recipients.length; i++) {
        for (let j = 0; j < recipients.length; j++)
            if (recipients[i].id === recipients[j].id) {
                continue
            } else if (recipients[i].document.id === recipients[j].document.id && recipients[i].document.id === document.id) {
                recipientCompared.push(recipients[i])
                break;
            } else if(recipients[i].document.id === document.id){
                recipientCompared.push(recipients[i])
                break;
            }
    }
    return recipientCompared
}

export function determineStatus(status) {
    switch (status) {
        case 0:
            return {text: "Venter på signering", color: "red lighten-2", icon: "mdi-alert-circle-outline"};
            break;
        case 1:
            return {text: "Delvis signert", color: "orange lighten-2", icon: "mdi-progress-check"}
            break;
        case 2:
            return {text: "Signert", color: "green lighten-2", icon: "mdi-check"}
            break;
        default:
            break;
    }
}
