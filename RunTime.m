%Brent Baker (.1773) (%50)
%Feras Deiratany (.1) (%50)
%Calculates runtime for each search method and generates histograms and 
%calculates mean and variance

StartStates = {'012453786','013425786','013426758','013725846','023145786','023146758','023156478','023185476','026135478','043215786','052143786','053216478','102453786','102456738','102483765','103425786','103426758','103428765','103526478','103528467','103628475','103725846','103726548','105432786','120453786','120463758','120563478','120573486','120763548','123045786','123046758','123068475','123076548','123085476','123405786','123406758','123408765','123450786','123456078','123456708','123456780','123460758','123468075','123468705','123468750','123485076','123485706','123485760','123506478','123560478','123570486','123576048','123576408','123576480','123648057','123706548','123740865','123745806','123745860','123746508','123748065','130425786','130426758','130724865','134702586','135420786','135742086','136208475','136402758','136420758','136428075','136428705','150482763','152043786','152370486','152403786','152430786','152436708','152480763','152743086','152748630','152803476','152836047','162453780','162503478','162743580','182403765','203145786','203146758','203156478','230145786','230156478','236158047','243015786','243018765','243106758','243715860','253176480','401752863','403218765'};
i = 1;
while (i < 101)
    start =  StartStates{i};
    tic
    f = BFS(start,'123456780');
    t(i) = toc;
    disp(i)
    i = i + 1;
end
M = mean(t);
V = var(t);
h = hist(t)