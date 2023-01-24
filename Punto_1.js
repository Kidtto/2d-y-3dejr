//Crear un array de 10 posiciones, con valores puestos por defecto e imprimir el array. 
'use strict';
let miarreglo=[1,2,3,4,5,6,7,8,9,10];
let miarreglo2 =[5,6,7,8,10,9,4,3,2,1];


for(let i=0;i<miarreglo.length;i++){
    console.log(miarreglo[i]);

}
//Sumar los valores de un array y mostrar el resultado. 
let suma = miarreglo.reduce((previous, current) => current += previous);;
console.log("La suma es ",suma);
//	Hacer la media de los valores de un array y mostrar el resultado. 
miarreglo.sort((a, b) => a - b);
let alto= Math.floor((miarreglo.length - 1) / 2);
let bajo= Math.ceil((miarreglo.length - 1) / 2);
let media=(miarreglo[bajo] + miarreglo[alto]) / 2;
console.log("La media es",media);
//	Dado un array de números con el método Sort, ordenaelos y mostrar su contenido. 
miarreglo2.sort();
console.log("no se",miarreglo2);
//	Dado un array de números, mostrar el mayor y el menor. 
