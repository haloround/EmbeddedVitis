module breath_led(
    input          sys_clk        , //ϵͳʱ�� 50MHz
    input          sys_rst_n      , //ϵͳ��λ���͵�ƽ��Ч
	input          sw_ctrl        , //�����ƿ��ؿ����ź� 1���� 0:��
    input          set_en         , //���ú�����Ƶ������ʹ���ź�
    input   [9:0]  set_freq_step  , //���ú�����Ƶ�ʱ仯����
    
    output         led              //LED��
);

//parameter define
parameter  START_FREQ_STEP = 10'd1; //����Ƶ�ʲ�����ʼֵ
parameter CNT_2US_MAX = 7'd100;    
parameter CNT_2MS_MAX = 10'd1000; 
parameter CNT_2S_MAX  = 10'd1000; 

//reg define
reg [6:0] cnt_2us; 
reg [9:0] cnt_2ms;   
reg [9:0] cnt_2s;     
reg       inc_dec_flag; //���ȵ���/�ݼ� 0:���� 1:�ݼ�
reg [9:0] freq_step   ; //������Ƶ�ʼ������
reg       led_t       ;

//*****************************************************
//**                  main code
//*****************************************************
assign led = led_t & sw_ctrl;

//����Ƶ�ʼ��,Ƶ�ʲ���ֵ��1-10֮��
always @(posedge sys_clk) begin
    if(!sys_rst_n)
        freq_step <= START_FREQ_STEP;
    else if(set_en) begin
        if(set_freq_step == 0)
            freq_step <= 10'd1;
        else if(set_freq_step >= 10'd10)
            freq_step <= 10'd10;
        else    
            freq_step <= set_freq_step;
    end        
end

//cnt_2us:����2us
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt_2us <= 7'b0;
    else if(cnt_2us == (CNT_2US_MAX - 7'b1 ))
        cnt_2us <= 7'b0;
    else
        cnt_2us <= cnt_2us + 7'b1;
end

//cnt_2ms:����2ms
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt_2ms <= 10'b0;
    else if(cnt_2ms == (CNT_2MS_MAX - 10'b1) && cnt_2us == (CNT_2US_MAX - 7'b1))
        cnt_2ms <= 10'b0;
    else if(cnt_2us == CNT_2US_MAX - 7'b1)
        cnt_2ms <= cnt_2ms + 10'b1;
    else
        cnt_2ms <= cnt_2ms;
end

//cnt_2s:����2s
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        cnt_2s <= 10'b0;
    else if(cnt_2s >= (CNT_2S_MAX - 10'b1) && cnt_2ms == (CNT_2MS_MAX - 10'b1) && cnt_2us == (CNT_2US_MAX - 7'b1))
        cnt_2s <= 10'b0;
    else if(cnt_2ms == (CNT_2MS_MAX - 10'b1) && cnt_2us == (CNT_2US_MAX - 7'b1))
        cnt_2s <= cnt_2s + freq_step;
    else
        cnt_2s <= cnt_2s;         
end

//inc_dec_flagΪ�͵�ƽ��led���ɰ�������inc_dec_flagΪ�ߵ�ƽ��led�������䰵
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        inc_dec_flag <= 1'b0;
    else if(cnt_2s >= (CNT_2S_MAX - 10'b1) && cnt_2ms ==( CNT_2MS_MAX - 10'b1) && cnt_2us == (CNT_2US_MAX - 7'b1))
        inc_dec_flag <= ~inc_dec_flag;
    else
        inc_dec_flag <= inc_dec_flag;
end

//led:����ź����ӵ��ⲿ��led��
always@(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n)
        led_t <= 1'b0;
    else if((inc_dec_flag == 1'b1 && cnt_2ms >= cnt_2s) || (inc_dec_flag == 1'b0 && cnt_2ms <= cnt_2s))
        led_t <= 1'b1;
    else
        led_t<= 1'b0;
end

endmodule