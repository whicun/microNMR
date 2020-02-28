function tuning (myNMR)
%
% myNMR : uNMR class
%

%% tuning 2, using method 6 to get the full curves
    p = pindex;

    LarmorFreq = 23.3e6;
    LarmorFreq = myNMR.MagnetFreq(22,3);
    o1 = 40e3;
    myNMR.setNMRparameters(p.i_freq,LarmorFreq+o1); pause(0.1);
    
    %%
    rg = 2;
    
    DS = 0;
NA = 1;
TD = 1000;
RD = 2e6;


myNMR.setNMRparameters(p.i_RD, RD); pause(0.1);
myNMR.setNMRparameters(p.i_ds, DS);pause(0.1);
myNMR.setNMRparameters(p.i_recgain,rg);pause(0.1);
myNMR.setNMRparameters(p.i_TD, TD);pause(0.1);
myNMR.setNMRparameters(p.i_na, NA); pause(0.1);
myNMR.setNMRparameters(p.i_tuningcap,2000); pause(0.1);


for ii=1:5
    myNMR.startExpt(5,1);
    pause(2)
    x = myNMR.readstatus()
    y = myNMR.read_NMR_data(x);
    nmrplot(y)
    title(num2str(ii))
    pause(1)
end
 %%

myNMR.startExpt(6,1);   % 5 is tuning; 6=>get full tuning curve
disp 'starting ...'
    x=0;
    while x==0
        pause(2);
        fprintf(1,'waiting ... ')
        x = myNMR.readstatus();      
    end
    %disp(['Data to transfer=',num2str(x)])
    y = myNMR.read_NMR_data(x); %*2.5/2^12;

    params = myNMR.readparams;

    nmrplot(y(1:100))
    %
    figure(1)
    frq = imag(y(101+20:140));
    capbias = imag(y(101:120));
    ampl = reshape(real(y(101:end)),20,20);
    subplot(311)
    plot(ampl(:))
    subplot(312)
    plot(frq,ampl(:,:))
   xlabel(['freq offset (kHz) from ' num2str(params(p.i_freq)/1000000,5) ', MHz'])

   [pp,peaks] = max(ampl,[],1);
   subplot(313)
   plot(capbias,frq(peaks),'o-')
   xlabel('cap bias 0 - 4096')
   ylabel('peak freq offset, kHz')
   %
   for ii=1:length(frq)
        fp = polyfit(frq,log( ampl(:,ii)),2);
        pcenter(ii) = -fp(2)/2/fp(1);
   end
   
   subplot(313)
   hold on
   plot(capbias,pcenter,'r-')
   hold off
   %
   figure(2)
   subplot(211)
   nmrplot(y(1:100),10)
   xlabel('acquired data points, us')
   subplot(212)
   plot(frq,ampl(:,end),'o')
   hold on
   plot(frq,exp(frq.^2*fp(1) + frq*fp(2) + fp(3)),'r-')
   hold off
   xlabel('freq scan from the center, kHz')
end


function doTuningMethod1(myNMR)
%% do scan freq, method 5, very slow.
myO1list = (-10:10)/20*1e6;
myBiaslist = (100:500:4000);
p = pindex;

DS = 0;
NA = 2;
TD = 100;
RD = 2e6;
myNMR.setNMRparameters(p.i_RD, RD); pause(0.1);
myNMR.setNMRparameters(p.i_ds, DS);pause(0.1);
myNMR.setNMRparameters(p.i_recgain,3);pause(0.1);
myNMR.setNMRparameters(p.i_TD, TD);pause(0.1);
myNMR.setNMRparameters(p.i_na, NA); pause(0.1);
ampl=[];
for kk = 1:length(myBiaslist)
    for ii=1:length(myO1list)
        o1 = myO1list(ii);

        myNMR.setNMRparameters(p.i_freq, LarmorFreq+o1);pause(0.1);
        myNMR.setNMRparameters(p.i_tuningcap, myBiaslist(kk)); pause(0.1);

        % ------- Start TX/RX self test
        myNMR.startExpt(5,1);   % 5 is tuning; 6=>get full curve

        x=0;
        while x==0
            pause(1);
            x = myNMR.readstatus();      
        end
        %disp(['Data to transfer=',num2str(x)])

        y = myNMR.read_NMR_data(x)*2.5/2^12;
        y1 = mean(y(25:45));
        %phase(ii)  = y1;
        ampl(ii,kk) = abs(y1);
    end
    disp (['finish ' num2str(kk) 'th cap value'])
end
disp 'All done'

    figure(1)
    subplot(111)
    plot(myO1list/1e3,ampl)
    xlabel('freq offset, kHz')
end
