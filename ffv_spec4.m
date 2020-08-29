function [ffv]= ffv_spec4(f1,f2,rho,k)
rho1=[rho(117:139) rho(245:267) rho(373:395)];
l=length(rho1);
m=length(k);
ffv=zeros(1,l);
fn1=find(rho1>=0);
fn2=find(rho1<0);
% for i=1:l
%     if rho1(i)>=0
%         sum=0;
%         sum1=0;
%         sum2=0;
%         for j=1:m
%             z=2.^-rho1(i).*k(j);
%             beta1=ceil(z)-z;
%             x=beta1.*abs(f1(floor(z)+256))+(1-beta1).*abs(f1(ceil(z)+256));
%             x1=abs(f2(k(j)+256));
%             sum=sum+x1.*x;
%             sum1=sum1+x1.^2;
%             sum2=sum2+x.^2;
%         end
%          ffv(i)= rho_gr_zero(f1,f2,rho1(i),k);
        p=2.^-rho1(fn1);
        z=bsxfun(@times,k,p(:));
        beta1=ceil(z)-z;
        x=beta1.*abs(f1(floor(z)+256))+(1-beta1).*abs(f1(ceil(z)+256));
        x1=abs(f2(k+256));
        sum1=x(:,1:512)*x1';
        sum2=sum(x1.^2);
        sum3=sum(x(:,1:512)'.^2);
        if (sum2.*sum3)==0
            ffv(fn1)=sum1'./(sqrt(sum2.*sum3)+eps);
        else
            ffv(fn1)=sum1'./sqrt(sum2.*sum3);
        end
            
%         z=2.^-rho1(i).*k;
%         beta1=ceil(z)-z;
%         x=beta1.*abs(f1(floor(z)+256))+(1-beta1).*abs(f1(ceil(z)+256));
%         x1=abs(f2(k+256));
%         sum1=x*x1';
%         sum2=sum(x1.^2);
%         sum3=sum(x.^2);
%         ffv(i)=sum1./sqrt(sum2.*sum3);
%     elseif rho1(i)<0
%         s1=0;
%         s2=0;
%         s3=0;
%         for j=1:m
%             z1=2.^rho1(i).*k(j);
%             beta2=ceil(z1)-z1;
%             y=beta2.*abs(f2(floor(z1)+256))+(1-beta2).*abs(f2(ceil(z1)+256));
%             y1=abs(f1(k(j)+256));
%             s1=s1+y1.*y;
%             s2=s2+y1.^2;
%             s3=s3+y.^2;
%         end
        q=2.^rho1(fn2);
        z1=bsxfun(@times,k,q(:));
        beta2=ceil(z1)-z1;
        y=beta2.*abs(f2(floor(z1)+256))+(1-beta2).*abs(f2(ceil(z1)+256));
        y1=abs(f1(k+256));
        s1=y(:,1:512)*y1';
        s2=sum(y1.^2);
        s3=sum(y(:,1:512)'.^2);
        if (s2.*s3)==0
            ffv(fn2)=s1'./(sqrt(s2.*s3)+eps);
        else
            ffv(fn2)=s1'./sqrt(s2.*s3);
        end
        
        
%             z1=2.^rho1(i).*k;
%             beta2=ceil(z1)-z1;
%             y=beta2.*abs(f2(floor(z1)+256))+(1-beta2).*abs(f2(ceil(z1)+256));
%             y1=abs(f1(k+256));
%             s1=y*y1';
%             s2=sum(y1.^2);
%             s3=sum(y.^2);
%             ffv(i)=s1./sqrt(s2.*s3);
%          ffv(i)= rho_less_zero(f1,f2,rho1(i),k);
%     end
% end
% plot(20.*log10(abs(ffv.*ffv)+eps));
