// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

//void while2(int M[], int start, int end) {
//    for (int i = start; i < end; i++) {
//       M[i] = -1;
//    }
//}

//int main() {
//    int M[24576];
    
//    while (1) {
//        if (M[24576] == 0) {
//        } 
//		  else {
//            int i = 16384;              
// 

//           while (i < 24576) {
//                while2(M, i, 24576);
//                i++;
//            }
//        }
//    }
    
//    Exit point
//    return 0;
//}

//while         // (WHILE)
//int i = 16384 // @16384 , D=A, @i, D=M-D

//if (i >= 24576) // @24576 , D=A, @i, D=M-D, 計算 i 與 24576 的差距（D=M-D），然後檢查 i 是否大於或等於 24576。如果是，則跳轉到標籤 WEND，否則繼續執行後面的代碼
//	goto WEND;    // @WEND , D;JGE
//int color = 0;  // @color , M=0
//if(M[24576]==0) // @24576 , D=Memory
//int color = 0;  // @color, M=0   // 白色
//if (M[24576]==0) //   @24576, D=M
//  goto NEXT;     //   @NEXT, D;JEQ
//color = -1;      //   @color, M=-1  // 黑色, 將 color 設置為 -1（黑色）
//  NEXT:          // (NEXT)
//  M[i] = color;  //   @color, D=M, @i, A=M, M=D // 將 M[i] 的值設置為 color 的值，然後將 i 的值增加 1，最後跳轉到 WHILE
//  i++;           //   @i, M=M+1
//   goto WHILE;   //   @WHILE, 0;JMP
//  WEND:          // (WEND)
//
//  goto FOREVER;  //   @FOREVER, 0;JMP //WEND 的標籤，表示程序將在這裡繼續執行。它跳轉到 FOREVER，形成一個無窮循環。

(FOREVER)
// int i = 16384;
  @16384
  D=A
  @i
  M=D

(WHILE)
// if (i >= 24576) goto WEND;
  @24576
  D=A
  @i
  D=M-D // (D=i-24576)
  @WEND
  D;JGE

// int color = 0;
  @color
  M=0   // 白色

// if (M[24576]==0)
  @24576
  D=M

// goto NEXT;
  @NEXT
  D;JEQ

// color = -1;
  @color
  M=-1  // 黑色

(NEXT)
// M[i] = color;
  @color
  D=M
  @i
  A=M
  M=D

// i++;
  @i
  M=M+1

// goto WHILE;
  @WHILE
  0;JMP

(WEND)
// goto FOREVER;
  @FOREVER
  0;JMP