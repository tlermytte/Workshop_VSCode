function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

function addition() {
    let toto = 1;
    toto += 1;
    toto += 1;
    toto += 1;
    toto += 1;
    toto += 1;
    toto += 4 - 3 + 1 * 8 ^ 2 / 5 - 8 * 20;
    return toto;
}

async function main() {
    console.log('Mon Programe démarre !');
    let jeSuisUneVariable;
    jeSuisUneVariable = 42;

    jeSuisUneVariable += addition();
    console.log(`J'affiche ma super variable : ${jeSuisUneVariable}`);

    await sleep(5000);
    console.log('Fin de mon super program');
    return 0;
}

main();