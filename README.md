# Compiler
Basic block,CFG

       *For a given c language statements 'basic blocks' are generated and then for that basic blocks 'flow graph' is generated.

Constantpropagation
      
      *For a given c language statements basic block,control flow graph is generated.It removes the 'constant folding' and generates optimized three address statements.

boolean backpatching
       
       *truelist and falselist are generated for a given boolean expression.
       
for-while
       
       *Given 'for' statement is converted into 'while' statement. 
       
if else
       
       *For a given set of 'if-else' statement the missing 'else' statement is appended in its respective position.

labled tree
       
       *For a given arithmetic expression the 'machine code' is generated using the available registers.

symbol table
     
     *For a given declaration statements respective 'Symbol table' is created.
      
syntax tree
      
      *For a given arithmetic expression 'Syntax tree' is generated.
     
     
Compilation/Execution steps:(Ubuntu version 14.04)

      1 open the terminal
      2 cd "Folder Name" or cd FolderName   //Move to the respective folder
      3 lex filename.l
      4 yacc -d filename.y
      5 gcc lex.yy.c y.tab.c -ll   //for the folders:syntax tree,if else,symbol table,for-while
      6 ./a.out
      5 g++ lex.yy.c y.tab.c -lfl  //for the folders:labled tree;Basic block,CFG;Constantpropagation,boolean backpatching
      6 ./a.out<input text file
      
