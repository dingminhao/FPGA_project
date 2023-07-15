function out = conv2d( I,Kw,Kb )
    [H,W,C] = size(I);
    [KN,KC,KH,KW]=size(Kw);%  [1,2,3,4]  1ά�����ж��ٸ�����ˣ�2ά�����ͨ����������˵Ĵ�ֱ���ȣ�����˵�ˮƽ����
    if( C~=KC )
        disp('ͨ������ƥ��');
        return;
    end
    CONV_OUT_H = H-KH+1;
    CONV_OUT_W = W-KW+1;
    out = zeros(CONV_OUT_H,CONV_OUT_W,KN);
    
    for k=1:KN%�����������
        tp = zeros(CONV_OUT_H,CONV_OUT_W,C);
        for c=1:C%����ͨ��
            for i=1:CONV_OUT_H
                for j=1:CONV_OUT_W
                    for y=1:KH
                        for x=1:KW
                            tp(i,j,c) = tp(i,j,c)+I(i+y-1,j+x-1,c)*Kw(k,c,y,x);
                        end
                    end
                end
            end
            out(:,:,k)=out(:,:,k)+tp(:,:,c);
        end
        out(:,:,k) = out(:,:,k) + Kb(k);
    end
    
end

