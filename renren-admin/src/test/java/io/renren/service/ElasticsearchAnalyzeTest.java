package io.renren.service;

import com.google.gson.Gson;
import com.google.gson.internal.LinkedTreeMap;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

import java.util.*;

/**
 * @author 李帅超
 * @Description: TODO
 * @date 2018-03-07 16:48
 */
public class ElasticsearchAnalyzeTest {

    public static void main(String[] args) {
        String str = "摘要：在当代中国，开展资产证券化和贷款转让已成为大热的趋势。中国银行业贷款的结构也已经发生了显著变化，存短贷长的矛盾日益凸显，客户集中度和行业集中度维持在较高水平，而这一方面需要新增贷款调结构，更重要的是存量贷款的调结构。开展贷款转让和资产证券化，不仅有利于我国商业银行达到监管要求，也有利于防范和化解银行风险，本文就对资产证券化的基本内容进行阐述，概述了其发展历程以及对宏观经济调控所起到的积极作用。 关键词：资产；现金流；收益；资产证券化；经济调控 引言： 资产证券化的产生被誉为是自二十世纪三十年代以来金融领域最具生命力和创新的金融创新，其具有降低交易成本和提高金融领域的运行效率等优点，这些使其在金融领域焕发新的生机，所谓的宏观调控指的是为了促进经济增长、增加就业、稳定物价总水平和保持国际收支平衡而通过政府实施的政策措施以调节市场经济的运行，本文就阐述了资产证券化在我国宏观经济调控中的积极作用。 1.资产证券化简介 1.1资产证券化的概念及分类 通俗而言资产证券化是指将缺乏流动性、但具有可预期收入的资产，通过在资本市场上发行证券的方式予以出售，以获取融资，最大化的提高资产的流动性。资产证券化在一些发达国家运用非常普遍。目前美国一半以上的住房抵押贷款和四分之三以上的汽车贷款是靠發行资产证券提供的。资产证券化是通过在资本市场和货币市场发行证券来筹资的一种直接融资方式。 广义上讲，资产证券化分四类，第一类是实体资产证券化、第二类是信贷资产证券化、第三类是证券资产证券化、第四类是现金资产证券化。 1.2资产证券化的重要运作机理 资产证券化相关的运作机理是其运作得以顺利进行的保障，在资产证券化的运作中重要的原理包括如下三点：其一，资产重组原理，即通过对资产的合理组合以实现在收益目标和特征不变的情况下，投资利益可以尽量大而风险尽量降低；其二，风险隔离原理，知识资产证券化的重要特征，既规定了真实出售作为前提，也使得特殊目的信托机构的唯一目的是经营和运作资产证券化；最后，是信用增级原理，指的是运用相应的金融工具和手段使得资产的信用级别升高，从而起到降低发起人的筹资成本的作用[1]。 2.我国资产证券化的发展历程 在中国，资产证券化起步较晚，直到2005年央行和银监会才联合发布《信贷资产证券化试点管理办法》，随后建设银行和国家开发银行获准进行信贷资产证券化首批试点。2007年，国家又在浦发银行、工商银行、兴业银行、浙商银行及上汽通用汽车金融公司等机构进行了第二批试点。但是就在第二批试点额度用完之时，恰逢2008金融危机席卷全球，由于经验不足和对资产证券化产品的谈虎色变令这一新兴事物的成长戛然而止。但是在经历了2009年的信贷狂飙之后，监管部门对资本充足率的硬约束以及随后的信贷收紧令，使得业界对资产证券化重启和扩容的呼声又起[2]。 2008年国际金融危机后，全球金融机构对于资本的需求普遍提高。欧美银行主要通过剥离非核心资产来筹集资本，而中国银行业则从资本市场上大规模融资来补充资本。开展资产证券化和贷款转让已势在必行。2005年中国人民银行和银监会联合发布了《信贷资产证券化试点管理办法》，我国资产证券化经过近6年试点，已经积累了大量的经验；而我国贷款转让市场交易规模于2008年已达到8000亿元左右，2009年以来随着银行新增贷款规模大幅增长，贷款转让业务加速发展。中国银行业贷款的结构也已经发生了显著变化，存短贷长的矛盾凸显，客户集中度和行业集中度维持在较高水平，这一背景下需要新增贷款调结构，更重要的是存量贷款的调结构。 3.资产证券化对我国宏观调控的积极作用 首先，就是资产证券化的出现使得借款人和最终的贷款的使用者之间关系紧密，直接减少了银行在中间的媒介功能，银行和公开市场之间的界定模糊化，从而改变了金融的结构，提高了金融的工作进行效率[3]；其次，根据经济学相关的原理，资产权利形式存在的证券化资产通用性和流动性都极强，因此资产证券化在宏观上提高了对资源的利用率；第三，资产证券化可以通过将金融风险转给那些愿意并可以承担风险的社会个体和对银行信贷过程中的隐蔽风险的公开化这两种途径，实现对金融危机的防范和应对；第四，通过上述对金融结构的优化以及对金融体系稳定性的提高，能够对经济增长起到促进作用；最后，资产证券化也使得货币政策在金融市场中的流动性和影响力增强，相应的形式和内容也逐渐丰富。 4.资产证券化的发展建议 上述阐述了资产证券化对我国宏观调控的积极作用，但是经历了美国的金融危机之后，也让人们认识到了资产证券化的潜在风险，因此本文提出几点资产证券化的优化发展措施：其一，要逐渐完善资产证券化的相关管理和发展政策的建立，使得其发展有明确而可实施的方案和计划，并在合理而有效的管理下健康发展；其二，通过系统的建设来提高资产证券化的业务效率和管理水平；其三，要改进资产证券化的业务组织和促进发展的机制[4]；其三，应大力促进其试点业务向常规业务转变；其四，完善会计、税收、法律环境建设；其五，建立完善、统一的交易机制和交易平台；其六，逐步丰富资产证券化的参与主体，扩大基础资产的发行范围；其七，逐渐推进资产证券化衍生产品的创新。 结论： 综上所述，资产证券化在我国虽然起步较晚，但是目前已经焕发出巨大的生命力，在我国的宏观调控中也展现出了巨大的作用，但也不能盲目的进行其相关建设和发展，次贷危机后明确其风险而积极的采取相应的优化的发展措施将是我国当下以及未来一段时间内的工作重点，未来我国的资产证券化发展值得期待！ 参考文献： [1]陈凌白.后次贷危机时代我国资产证券化发展现状与展望[J]辽宁大学学报（哲学社会科学版），2010，38（5）：133-137. [2].刘冠斌.浅析中国资产证券化的发展历程[J].现代经济信息，2017（13）. [3]肖崎.资产证券化的宏观经济效应：理论述评[J].新金融，2010（2）：39-43. [4]刘迁迁，王乐.我国信贷资产证券化的发展及对策研究[J].当代经济管理，2015，37（12）：81-84.";
        RestTemplate restTemplate = new RestTemplate();
        String url = "http://47.94.148.160:9200/_analyze?pretty";
        HttpHeaders headers = new HttpHeaders();
        MediaType type = MediaType.parseMediaType("application/json; charset=UTF-8");
        headers.setContentType(type);
        String requestJson = "{\n" +
                "  \"analyzer\": \"ik_smart\",\n" +
                "  \"text\": \""+str+"\"\n" +
                "}";
        HttpEntity<String> entity = new HttpEntity<String>(requestJson,headers);
        String result = restTemplate.postForObject(url, entity, String.class);
        Gson gson = new Gson();
        HashMap<String,List<LinkedTreeMap<String,String>>> hashMap = gson.fromJson(result, HashMap.class);
        LinkedTreeMap<String, Integer> objectObjectLinkedHashMap = new LinkedTreeMap<String,Integer>();
        hashMap.forEach((s, list) -> {
            System.out.println(s);
            list.stream().forEach(map->{
                String token = map.get("token");
                if(token.length()>1){
                    System.out.println(token);
                    Integer integer = objectObjectLinkedHashMap.get(token);
                    if(integer==null||integer==0){
                        objectObjectLinkedHashMap.put(token,1);
                    }else {
                        objectObjectLinkedHashMap.put(token,integer+1);
                    }
                }
            });
        });
        ArrayList<Map.Entry<String, Integer>> entries = new ArrayList<>(objectObjectLinkedHashMap.entrySet());
        entries.sort((en1, en2)->en2.getValue()-en1.getValue());
        System.out.println(entries);
        if(entries.size()>15){
            for (int i = 0; i < 15; i++) {
                System.out.println(entries.get(i).getKey());
            }
        }else {
            entries.stream().forEach(e-> System.out.println(e.getKey()));
        }
        //System.out.println(hashMap);
    }
}
