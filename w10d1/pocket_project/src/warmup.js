

const partyHeader = document.getElementById('party');

export const htmlGenerator = (string, htmlElement) => {
if (htmlElement.firstChild) {
    htmlElement.removeChild(htmlElement.childNodes[0]);
}   
let p = document.createElement("p");
 
 p.innerHTML = string;
 htmlElement.appendChild(p);
};

htmlGenerator('Pocket Projects!Welcome To the Pocket Project Marathon!', partyHeader);


