/*
Muhammad Ansari
Comp 469 Artificial Intelligence
Project #1: Family Tree
02/04/2018
*/

/*gender facts*/
male(himayat).
male(haseeb).
male(hameed).
male(shakeel).
male(hassan).
male(raziuddin).
male(irfan).
male(nasir).
male(maaz).
male(faizuddin).
male(hammad).
male(bilal).
female(nani).
female(ather).
female(juhui).
female(kishwar).
female(muazzama).
female(kasni).
female(asser).
female(fiza).
female(assia).
female(anum).
female(huma).
female(tooba).
female(natasha).
female(hania).
female(marium).
female(mehreen).
female(marina).
female(hafsa).
female(abiha).
female(suhana).
female(alishba).
female(amna).
female(fatima).
female(aishaNassir).
female(aishaKhan).

/*marriage facts*/
married(nani,himayat).
married(ather,shakeel).
married(juhui,hameed).
married(kishwar,raizuddin).
married(muazzama,hassan).
married(kasni,irfan).
married(haseeb,fiza).
married(asser,nasir).

/*parent facts*/
parent(nani,ather).
parent(nani,juhui).
parent(nani,kishwar).
parent(nani,muazzama).
parent(nani,kasni).
parent(nani,haseeb).
parent(nani,asser).
parent(himayat,ather).
parent(himayat,juhui).
parent(himayat,kishwar).
parent(himayat,muazzama).
parent(himayat,kasni).
parent(himayat,haseeb).
parent(himayat,asser).
parent(ather,assia).
parent(ather,huma).
parent(shakeel,assia).
parent(shakeel,huma).
parent(juhui,anum).
parent(juhui,tooba).
parent(juhui,maaz).
parent(hameed,anum).
parent(hameed,tooba).
parent(hameed,maaz).
parent(kishwar,natasha).
parent(kishwar,hania).
parent(kishwar,faizuddin).
parent(kishwar,hammad).
parent(kishwar,suhana).
parent(raziuddin,natasha).
parent(raziuddin,hania).
parent(razuddin,faizuddin).
parent(raziuddin,hammad).
parent(raziuddin,suhana).
parent(muazzama,bilal).
parent(hassan,bilal).
parent(kasni,marium).
parent(kasni,mehreen).
parent(kasni,marina).
parent(irfan,marium).
parent(irfan,mehreen).
parent(irfan,marina).
parent(haseeb,hafsa).
parent(haseeb,amna).
parent(haseeb,fatima).
parent(haseeb,aishaKhan).
parent(fiza,hafsa).
parent(fiza,amna).
parent(fiza,fatima).
parent(fiza,aishaKhan).
parent(asser,abiha).
parent(asser,alishba).
parent(asser,aishaNassir).
parent(nassir,abiha).
parent(nassir,alishba).
parent(nassir,aishaNassir).

/*rules*/
wife(X,Y):-female(X),married(X,Y).
husband(X,Y):-male(X),married(X,Y).
father(X,Y):- male(X),parent(X,Y).
mother(X,Y):-female(X),parent(X,Y).
son(X,Y):-male(X),parent(Y,X).
daughter(X,Y):-female(X),parent(Y,X).
brother(X,Y):-male(X),father(Dad,X), father(Dad,Y), X \= Y, mother(Mom,X),mother(Mom,Y).
sister(X,Y):-female(X),father(Dad,X), father(Dad,Y), X \= Y, mother(Mom,X),mother(Mom,Y).
grandfather(X,Y):- male(X), parent(Parent,Y), parent(X,Parent).
grandmother(X,Y):- female(X), parent(Parent,Y), parent(X,Parent).
aunt(X,Y):- female(X), parent(Parent,Y),sister(X,Parent).
uncle(X,Y):- male(X), parent(Parent,Y),brother(X,Parent).
cousin(X,Y):- uncle(Uncle,X),father(Uncle,Y).
nephew(X,Y):-male(X),aunt(Y,X);male(X),uncle(Y,X).
niece(X,Y):-female(X),aunt(Y,X);female(X),uncle(Y,X).
ancestor(X,Y):-parent(X,Y).
ancestor(X,Y):-parent(Z,Y), ancestor(X,Z).


