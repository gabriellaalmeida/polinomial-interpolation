using Plots

function inter_poli(x,fx,xponto)
    n = length(fx) #calculamos o tamanho da lista fx
    k = zeros(n,n) #k uma matriz nula n por n
    k[:,1] = fx #definimos a primeira linha de k como fx

    for  i = 1:n-1
        for j = 1:i
            k[i+1,j+1] = (k[i+1,j]-k[i,j])/(x[i+1]-x[i-j+1])
 #k sera atualizada de forma que seja a tabela de diferenças divididas
        end
    end
    ma = zeros(n)
    u = 1
    a = 1
    ma[1] = 1
    while u<n
        a *= xponto-x[u] # resumindo (X-X0)*(X-X1)*...*(X-Xn)
        ma[u+1] = a
        u += 1
    end
    poli = zeros(n)

    for c = 1:n
        poli[c] = k[c,c]*ma[c]
#Multiplicando a diagonal principal de k  pelo respectivo elemento de ma
    end
    final = sum(poli) #somamos todos os elementos de poli
    return final #mostramos o valor final
end


function fazer_grafico(x, fx, inicio, fim)
    #inicio e fim é o intervalo que sera calculado o gráfico
    mi = range(inicio, stop=fim, length=100) #dividimos o intervalo em 100 pontos(Partição) ,isto é,os xizes
    me = []
    for h in mi
        q = inter_poli(x, fx, h) #calculamos os respectivos f(x)para cada elemento da particão
        push!(me, q) #esses são os valores de f(x)
    end
    plot(mi, me)#tcharam um gráfico!!!!!
end


x = [] #inserir aqui os valores conhecidos de x
fx = [] #inserir os respectivos valores de f(x)
xponto =  #inserir o valor de x a ser calculado
inicio= #onde o gráfico começa
fim= #onde o gráfico termina
print("O valor f ($xponto) é igual a ",inter_poli(x,fx,xponto),". E o polinômio que satisfaz esses valores é representado pela função a seguir!")
fazer_grafico(x,fx,inicio,fim)




#NOS SOMOS FODA!!!
#FINALMENTE ACABOU!!!
#SO QUERO PASSAR,NAO AGUENTO + !!!
