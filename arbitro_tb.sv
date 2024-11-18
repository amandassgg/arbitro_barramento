// Disciplina de Lógica Digital
// Aluna: Amanda Sousa Gonçalves
//Testbench para árbitro de barramento
`timescale 1 ns / 10 ps

module tb;
  reg [3:0] req;  	//entrada req;
  wire [3:0] grant; 
  wire[1:0] grant_num; 
  wire avbl;
  
  arbitro AMANDA (		//instanciando
    .req(req),
    .grant(grant),
    .grant_num(grant_num),
    .avbl(avbl)
  );

  initial begin			//gerando os estímulos	
    for (int i = 0; i < 16; i++) begin
      req = i[3:0]; 
      #4;          
    end
	req = 4'b0000; //para a visualização nas formas de onda ser melhor
	#4;
  end


  initial begin
    $display("                Tempo        Entrada                     Saídas");
    $display("                              req           grant      grant_num     avaiable");
    $display("                .....      ..........      ...................................");
    $monitor($time, "          %b           %b         %b            %b", req, grant, grant_num, avbl);
  end

endmodule

