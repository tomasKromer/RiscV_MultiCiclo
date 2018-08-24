//Modulo CPU
//Funciones: Instaciar todos los modulos particulares del cpu e interconectarlos para lograr el funcionamiento de un cpu
//Recordar que este sistema es e multiciclo


module CPU #(parameter Nbits=64)
           (input logic clk,rst,
           //output logic [Nbits-1:0] dataOut,
           output logic led);

//Señales de salida de sistemas
logic aluSRC,memToReg,r_enable,w_enable_reg,w_enable_mem,branch,zero,selInstrNext;
logic [63:0] regData,memData,pc,reg1,reg2,w_data_mem,immediate,aluInB,aluInA,aluResult,nextIns,pc_actual,nextInsBranch,muxMemToReg;
logic [31:0] instruc;
logic [1:0] aluOp;
logic [3:0] selOp;
logic [2:0] fun3;
logic [6:0] fun7;
logic [4:0] addr_reg1,addr_reg2,addr_regW,nextWrRegEX;
logic [6:0] opcode;
logic [63:0] x6;

//Señales de buffer de find IF
logic [63:0] PC_IF;
logic [31:0] instrucIF;

//Señales de Buffer de decode ID
logic [31:0] instrucID;
logic AluSRC_ID,MemToRegID,BranchID,MemWriteID,MemReadID,RegWriteID;
logic [4:0] addWrRegID;
logic [63:0] PC_ID,Reg1_ID,Reg2_ID,InmeID;
logic [1:0] AluOpID;
logic [1:0] fun3_ID;
logic [6:0] fun7_ID;

//señales de buffer de execute EX
logic [63:0] ResultEX,PcB_EX,addWrMemEX,Reg1_EX,Reg2_EX,Inme_EX;
logic [4:0] addWrRegEX;
logic [1:0] aluOpEX;
logic ZeroEX,BranchEX,MemReadEX,MemWriteEX,RegWriteEX,MemToRegEX,AluSRC_EX;
logic [1:0] fun3_EX;
logic [6:0] fun7_EX;

//Señales de buffer de MEM
logic [4:0] addWrRegMEM;
logic [63:0] ResultMEM,PcB_MEM,dataMem_MEM,dataWriteMem_MEM;
logic ZeroMEM,branchMEM,memReadMEM,memWriteMEM,regWriteMEM,memToRegMEM;

//Señales de buffer de WB
logic [4:0] addRegWriteWB;
logic [63:0] ResultAluWB,DataMemWB;
logic MemtoRegWB,RegWriteWB;

//instanciacion de multiplexores del sistema
mux2 selAluS(Reg2_EX,Inme_EX,AluSRC_EX,aluInB);//multiplexor para control entrada B de la ALU
mux2 selMemToReg(ResultAluWB,DataMemWB,MemtoRegWB,muxMemToReg);//multiplexor para control si la salida es de memoria o de la ALU
mux2 selBranch(nextIns,PcB_MEM,selInstrNext,pc);//multiplexor para control del salto por branch


//instanciacion de unidades de control del sistema
controlCPU monitoreo(opcode,aluOp,branch,w_enable_mem,w_enable_reg,memToReg,aluSRC,MemReadID);//unidad de control de todo el sistema
PC contadordeProg (pc,clk,rst,pc_actual);//bloque donde se actualiza el programCounter
aluControl controlALU(fun3_EX,fun7_EX,aluOpEX,selOp);//unidad de contro de la ALU

//instanciacion de unidades de memoria del sistema
instrucMem memoriaInstruc(pc_actual,instruc);//Memoria de instruccion
memSys memoriaSistema (memWriteMEM,clk,memReadMEM,ResultMEM,dataWriteMem_MEM,dataMem_MEM);//Memoria del sistema 
regMem memoriaRegistros (RegWriteWB,clk,addr_reg1 ,addr_reg2,addRegWriteWB,muxMemToReg,reg1,reg2,x6);//Registros de memoria del procesador




//instanciacion de unidades de procesamiento del sistema
alu aluPro (aluInA,aluInB,selOp,ZeroEX,ResultEX);//La unidad ALU del procesador
immedia_32a64 traduccion32a64(instrucID,immediate);//Traduccion de la constante inmediata de 12 a 64 bits
addNextIns calNextInst(pc_actual,nextIns);// calculador de la siguiente instruccion
nextInsBran nextInsSiBranch (PcB_EX,Inme_EX,PcB_EX); //Calculador de la siguiente instruccion si hubo un branch

//Buffers para lograr el multiciclo
buffer_IFID b_IFID(instrucIF,PC_IF,clk,instrucID,PC_ID);
buffer_IDEX b_IDEX(clk,AluSRC_ID,BranchID,MemWriteID,MemReadID,MemToRegID,RegWriteID,addWrRegID,PC_ID,Reg1_ID,Reg2_ID,InmeID,AluOpID,fun3_ID,fun7_ID,addWrRegEX,AluSRC_EX,MemToRegEX,BranchEX,MemWriteEX,MemReadEX,RegWriteEX,PcB_EX,Reg1_EX,Reg2_EX,Inme_EX,aluOpEX,fun3_EX,fun7_EX);
buffer_EXMEM b_EXMEM(clk,ZeroEX,BranchEX,MemReadEX,MemWriteEX,RegWriteEX,MemToRegEX,addWrRegEX,ResultEX,PcB_EX,Reg2_EX,addWrRegMEM,ResultMEM,PcB_MEM,ZeroMEM,branchMEM,memReadMEM,memWriteMEM,regWriteMEM,memToRegMEM,dataWriteMem_MEM);
buffer_MEMWB b_MEMWB(clk,memToRegMEM,regWriteMEM,addWrRegMEM,ResultMEM,dataMem_MEM,addRegWriteWB,ResultAluWB,DataMemWB,MemtoRegWB,RegWriteWB);


         
//Asignacion de señales para su interconexion

//Asignaciones para buffer IF-ID entradaIF
assign instrucIF = instruc;
assign PC_IF = pc_actual;

//Asignaciones para buffer IF-ID salida ID
assign opcode = instrucID[6:0];

//Asignaciones para buffer ID-EX entrada ID
assign AluSRC_ID = aluSRC;
assign BranchID = branch;
assign MemWriteID = w_enable_mem;
assign MemToRegID = memToReg;
assign RegWriteID = w_enable_reg;
assign addWrRegID = instrucID[11:7];
assign Reg1_ID = reg1;
assign Reg2_ID = reg2;
assign InmeID = immediate;
assign fun3_ID = instrucID[14:12];
assign fun7_ID = instrucID[31:25];
assign AluOpID = aluOp;
assign addr_reg1 = instrucID[24:20];
assign addr_reg2 = instrucID[11:7];

//Asignaciones para buffer ID-EX salida EX
assign aluInA = Reg1_EX;

//Asignaciones para buffer EX-MEM entrada EX






//Forma de ver la salida del led
assign led = x6[0];

//Logica adicional
assign selInstrNext = ZeroMEM & branchMEM;


endmodule
