//Árbitro de barramento
//Defini prioridade da seguinte forma: R[0]>R[1]>R[2]>R[3]
//Disciplina de Lógica Digital
//Aluna: Amanda Sousa Gonçalves
//OBS.: Arbitrariamente, escolhi os valores de grant de 4'b000 para casos sem solicitação (evitando "dont care").

`timescale 1 ns / 10 ps

module arbitro (
	input reg [3:0] req,		//reg estão dentro de blocos "always"
	output reg avbl,
	output reg [3:0] grant,
	output reg [1:0] grant_num
);

always @* begin
    if (req == 4'b0000) begin // Verifica se não há nenhuma solicitação
        avbl = 1'b1;		//Seta o available
        grant = 4'b000; // "Don't care" para grant
        grant_num = 2'b00; // "Don't care" para grant_num
    end else if (req[0] == 1'b1) begin // Verifica a maior prioridade primeiro
        grant = 4'b0001;    
        grant_num = 2'b00;
        avbl = 1'b0;
    end else if (req[1] == 1'b1) begin // Verifica a segunda maior prioridade
        grant = 4'b0010;
        grant_num = 2'b01;
        avbl = 1'b0;
    end else if (req[2] == 1'b1) begin // Verifica a terceira maior prioridade
        grant = 4'b0100;
        grant_num = 2'b10;
        avbl = 1'b0;
    end else if (req[3] == 1'b1) begin // Verifica a menor prioridade
        grant = 4'b1000;
        grant_num = 2'b11;
        avbl = 1'b0;
    end
end
endmodule


