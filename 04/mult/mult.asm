// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)


// Put your code here.
//int main() {
//    int R0 = 3;
//    int R1 = 5;
//    int R2 = 0;       //@2 , M=0
//    while (R0 > 0) {  // => loop: , @0 , D=M , @exit1 , D; JLE
//    R2 = R2 + R1;     //@1 , D=M , @2 , M=D+M
//    R0 = R0 - 1;      //@0 , M=M-1
//    printf("R0=%d R1=%d R2=%d\n", R0, R1, R2);
//    }
    
//  printf("R2=%d\n", R2);
//}

//C++語言寫法
// #include <stdio.h>

// int main() { // C++程式的進入點，main 函式是程式開始執行的地方。這個函式返回一個整數值，通常是程式的結束碼，0 表示成功執行，非零值表示出現錯誤
//    int R0 = 3; //代表定義了一個整數變數 R0，並給它賦值為 3
//    int R1 = 5; 
// => int R2 = 0; //表示將 R1 的值賦給 R2，即將 R2 初始化為 R1 的值，也就是 5。因此，最終的效果是 R2 被賦值為 5
@2
M=0
//  while (R0 > 0) {
// => loop: //跳到(loop)
(loop)
// => if (R0 <= 0) goto exit1; //如果 R0 的值小於或等於 0，則跳轉到標記為 exit1 的程式碼位置
@0
D=M
@exit1
D; JLE

// =>  R2 = R2 + R1; //假設在這之前 R2 的值是 x，R1 的值是 y，那麼這一行程式碼的執行後，R2 的值將被更新為 x + y
@1
D=M
@2
M=D+M

// =>  R0 = R0 - 1;
@0
M=M-1

//     printf("R0=%d R1=%d R2=%d\n", R0, R1, R2);
// =>  goto loop;
@loop
0;JMP

// => exit1:
(exit1)
@exit1
0;JMP
//    }
    
//     printf("R2=%d\n", R2);
// }
