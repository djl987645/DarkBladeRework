.class public Lcom/kt/olleh/inapp/net/Request;
.super Ljava/lang/Object;
.source "Request.java"


# static fields
.field private static final ADDINFO:Ljava/lang/String; = "add_info"

.field private static final APP_ID:Ljava/lang/String; = "app_id"

.field private static final APP_VER:Ljava/lang/String; = "oscv"

.field private static final BRAND_ID:Ljava/lang/String; = "brand_id"

.field private static final CHANNEL:Ljava/lang/String; = "channel"

.field private static final CHARGE_YN:Ljava/lang/String; = "charge_yn"

.field private static final CID:Ljava/lang/String; = "cid"

.field private static final CNAME:Ljava/lang/String; = "c_name"

.field private static final COMMAND:Ljava/lang/String; = "c"

.field private static final CONTENT:Ljava/lang/String; = "content"

.field private static final CONTENTS_TYPE:Ljava/lang/String; = "contents_type"

.field private static final C_ID:Ljava/lang/String; = "c_id"

.field private static final DEGREE:Ljava/lang/String; = "degree"

.field private static final DEVICE_NUMBER:Ljava/lang/String; = "dn"

.field private static final DEVICE_TYPE:Ljava/lang/String; = "dt"

.field private static final EMAIL:Ljava/lang/String; = "email"

.field private static final EVENTKEY:Ljava/lang/String; = "eventKey"

.field private static final F_ID:Ljava/lang/String; = "f_id"

.field private static final F_TYPE:Ljava/lang/String; = "f_type"

.field public static final GETSYMKEYGEN:Ljava/lang/String; = "getSymKeyGen"

.field private static final ID:Ljava/lang/String; = "id"

.field private static final JUMIN_NUM:Ljava/lang/String; = "jumin"

.field private static final KEYWORD:Ljava/lang/String; = "keyword"

.field private static final LCDSIZE:Ljava/lang/String; = "lcd"

.field private static final MAIN_YN:Ljava/lang/String; = "main_yn"

.field private static final ME2_ID:Ljava/lang/String; = "me2_id"

.field private static final ME2_KEY:Ljava/lang/String; = "me2_key"

.field private static final MODEL:Ljava/lang/String; = "model"

.field private static final MY_ONE_CODE:Ljava/lang/String; = "code_id"

.field private static final MY_ONE_DEVICE_INFO:Ljava/lang/String; = "device_info"

.field private static final MY_ONE_PNO:Ljava/lang/String; = "pno"

.field private static final MY_ONE_QNA_TITLE:Ljava/lang/String; = "qna_title"

.field private static final NEW_PWD:Ljava/lang/String; = "new_pwd"

.field private static final NOTICE_ID:Ljava/lang/String; = "notice_id"

.field private static final N_ID:Ljava/lang/String; = "n_id"

.field private static final OFF_SET:Ljava/lang/String; = "off_set"

.field private static final PARENT_ID:Ljava/lang/String; = "parent_id"

.field private static final PAY_KEY:Ljava/lang/String; = "pay_key"

.field private static final PAY_TYPE:Ljava/lang/String; = "pay_type"

.field private static final PG:Ljava/lang/String; = "pg"

.field private static final PG_SIZE:Ljava/lang/String; = "pg_size"

.field private static final PHONENO:Ljava/lang/String; = "phone"

.field private static final PWD:Ljava/lang/String; = "pwd"

.field private static final P_ID:Ljava/lang/String; = "p_id"

.field private static final P_TYPE:Ljava/lang/String; = "p_type"

.field private static final QNA_CONTENT:Ljava/lang/String; = "qna_content"

.field private static final QNA_ID:Ljava/lang/String; = "qna_id"

.field private static final QNA_TYPE:Ljava/lang/String; = "qna_type"

.field private static final REPLY_ID:Ljava/lang/String; = "reply_id"

.field private static final REPORT_CONTENT:Ljava/lang/String; = "report_content"

.field private static final REPORT_TYPE:Ljava/lang/String; = "report_type"

.field private static final REQUIRY_ID:Ljava/lang/String; = "requiry_id"

.field private static final REQ_TIME:Ljava/lang/String; = "rt"

.field private static final SELLER_ID:Ljava/lang/String; = "seller_id"

.field private static final STARSCORE:Ljava/lang/String; = "starscore"

.field private static final TRAND_ID:Ljava/lang/String; = "trand_id"

.field private static final TW_ID:Ljava/lang/String; = "tw_id"

.field private static final TW_PW:Ljava/lang/String; = "tw_pw"

.field private static final TYPE:Ljava/lang/String; = "type"

.field private static mAppVer:Ljava/lang/String;

.field private static mChannel:Ljava/lang/String;

.field private static mCommand:I

.field private static mDeviceNumber:Ljava/lang/String;

.field private static mDeviceType:Ljava/lang/String;

.field private static mLCDSize:Ljava/lang/String;

.field private static mMainUrl:Ljava/lang/String;

.field private static mModel:Ljava/lang/String;

.field private static mPageUrl:Ljava/lang/String;

.field private static mPhoneNo:Ljava/lang/String;

.field private static params:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation
.end field

.field private static streamData:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static clearParams()V
    .locals 1

    .prologue
    .line 292
    sget-object v0, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 293
    const/4 v0, 0x0

    sput-object v0, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    .line 294
    return-void
.end method

.method protected static getCommand()I
    .locals 1

    .prologue
    .line 285
    sget v0, Lcom/kt/olleh/inapp/net/Request;->mCommand:I

    return v0
.end method

.method public static getData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 299
    sget-object v0, Lcom/kt/olleh/inapp/net/Request;->streamData:Ljava/lang/String;

    return-object v0
.end method

.method public static getMainURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 267
    sget-object v0, Lcom/kt/olleh/inapp/net/Request;->mMainUrl:Ljava/lang/String;

    return-object v0
.end method

.method private static getPageUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 276
    sget-object v0, Lcom/kt/olleh/inapp/net/Request;->mPageUrl:Ljava/lang/String;

    return-object v0
.end method

.method public static getParams()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;"
        }
    .end annotation

    .prologue
    .line 289
    sget-object v0, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    return-object v0
.end method

.method public static init(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "mainUrl"    # Ljava/lang/String;
    .param p1, "pageUrl"    # Ljava/lang/String;
    .param p2, "phoneNo"    # Ljava/lang/String;
    .param p3, "deviceNumber"    # Ljava/lang/String;
    .param p4, "deviceType"    # Ljava/lang/String;
    .param p5, "model"    # Ljava/lang/String;
    .param p6, "lcd"    # Ljava/lang/String;
    .param p7, "appVer"    # Ljava/lang/String;
    .param p8, "channel"    # Ljava/lang/String;

    .prologue
    .line 199
    sput-object p0, Lcom/kt/olleh/inapp/net/Request;->mMainUrl:Ljava/lang/String;

    .line 200
    sput-object p1, Lcom/kt/olleh/inapp/net/Request;->mPageUrl:Ljava/lang/String;

    .line 201
    sput-object p2, Lcom/kt/olleh/inapp/net/Request;->mPhoneNo:Ljava/lang/String;

    .line 202
    sput-object p3, Lcom/kt/olleh/inapp/net/Request;->mDeviceNumber:Ljava/lang/String;

    .line 203
    sput-object p4, Lcom/kt/olleh/inapp/net/Request;->mDeviceType:Ljava/lang/String;

    .line 204
    sput-object p5, Lcom/kt/olleh/inapp/net/Request;->mModel:Ljava/lang/String;

    .line 205
    sput-object p6, Lcom/kt/olleh/inapp/net/Request;->mLCDSize:Ljava/lang/String;

    .line 206
    sput-object p7, Lcom/kt/olleh/inapp/net/Request;->mAppVer:Ljava/lang/String;

    .line 207
    sput-object p8, Lcom/kt/olleh/inapp/net/Request;->mChannel:Ljava/lang/String;

    .line 208
    return-void
.end method

.method public static request(I)Ljava/lang/String;
    .locals 1
    .param p0, "command"    # I

    .prologue
    .line 316
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static requestAdultPwd(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "adult_pwd"    # Ljava/lang/String;

    .prologue
    .line 1122
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1123
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pwd"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1125
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestAdultPwdInit(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "adult_pwd"    # Ljava/lang/String;
    .param p3, "new_adult_pwd"    # Ljava/lang/String;

    .prologue
    .line 1138
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1139
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pwd"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1140
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "new_pwd"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1143
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestAnroidManifest(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "c_id"    # Ljava/lang/String;
    .param p2, "f_id"    # Ljava/lang/String;

    .prologue
    .line 924
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 925
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "c_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 926
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "f_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 929
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestAppRecentVersion(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 1073
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1074
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "app_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1076
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestAppRecentVersionList(III)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I

    .prologue
    .line 1058
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1059
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1060
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1062
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestBeingSave(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "c_id"    # Ljava/lang/String;
    .param p2, "off_set"    # Ljava/lang/String;

    .prologue
    .line 907
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 908
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "c_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 909
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "off_set"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 912
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestBestList(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "main_yn"    # Ljava/lang/String;
    .param p4, "n_id"    # Ljava/lang/String;
    .param p5, "charge_yn"    # Ljava/lang/String;

    .prologue
    .line 529
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 530
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 531
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 532
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "main_yn"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 533
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 534
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "charge_yn"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 541
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestBrandCategory(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "brand_id"    # Ljava/lang/String;

    .prologue
    .line 465
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 466
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "brand_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 468
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestBrandList(IIILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "main_yn"    # Ljava/lang/String;
    .param p4, "brand_id"    # Ljava/lang/String;

    .prologue
    .line 446
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 447
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 448
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 449
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "main_yn"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 450
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "brand_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 455
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestBuy(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "p_type"    # Ljava/lang/String;
    .param p2, "p_id"    # Ljava/lang/String;
    .param p3, "n_id"    # Ljava/lang/String;
    .param p4, "f_type"    # Ljava/lang/String;
    .param p5, "payType"    # I
    .param p6, "payKey"    # Ljava/lang/String;

    .prologue
    .line 817
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 818
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 819
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 820
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 821
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "f_type"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 822
    const/4 v1, -0x1

    if-eq p5, v1, :cond_0

    .line 824
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pay_type"

    invoke-static {p5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 825
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pay_key"

    invoke-direct {v2, v3, p6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 831
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestBuyPwd(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "buy_pwd"    # Ljava/lang/String;

    .prologue
    .line 1087
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1088
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pwd"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1090
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestBuyPwdInit(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "buy_pwd"    # Ljava/lang/String;
    .param p3, "new_buy_pwd"    # Ljava/lang/String;

    .prologue
    .line 1103
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1104
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1105
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pwd"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1106
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "new_pwd"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1110
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestCategory(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "parent_id"    # Ljava/lang/String;

    .prologue
    .line 578
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 580
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "parent_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 582
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestContAllSearch(IIILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "keyword"    # Ljava/lang/String;

    .prologue
    .line 353
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 354
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 355
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 356
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "keyword"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 360
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestContSearch(IIILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "n_id"    # Ljava/lang/String;
    .param p4, "keyword"    # Ljava/lang/String;

    .prologue
    .line 330
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 331
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 332
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 333
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 334
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "keyword"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 340
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestContentInfo(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "cid"    # Ljava/lang/String;
    .param p2, "appid"    # Ljava/lang/String;

    .prologue
    .line 1200
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1201
    .local v0, "str":Ljava/lang/StringBuffer;
    if-eqz p1, :cond_0

    .line 1202
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "c_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1203
    :cond_0
    if-eqz p2, :cond_1

    .line 1204
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "app_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1205
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestContentRecommand(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "p_type"    # Ljava/lang/String;
    .param p2, "p_id"    # Ljava/lang/String;
    .param p3, "n_id"    # Ljava/lang/String;
    .param p4, "c_name"    # Ljava/lang/String;
    .param p5, "add_Info"    # Ljava/lang/String;
    .param p6, "me2_id"    # Ljava/lang/String;
    .param p7, "me2_key"    # Ljava/lang/String;
    .param p8, "tw_id"    # Ljava/lang/String;
    .param p9, "tw_pw"    # Ljava/lang/String;

    .prologue
    .line 850
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 851
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 852
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 853
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 854
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "c_name"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 855
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "add_info"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 856
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "me2_id"

    invoke-direct {v2, v3, p6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 857
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "me2_key"

    invoke-direct {v2, v3, p7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 858
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "tw_id"

    invoke-direct {v2, v3, p8}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 859
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "tw_pw"

    invoke-direct {v2, v3, p9}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 869
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestDetail(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "p_type"    # Ljava/lang/String;
    .param p2, "p_id"    # Ljava/lang/String;

    .prologue
    .line 621
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 622
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 623
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 626
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestDetail(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "p_type"    # Ljava/lang/String;
    .param p2, "p_id"    # Ljava/lang/String;
    .param p3, "n_id"    # Ljava/lang/String;

    .prologue
    .line 601
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 602
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 603
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 604
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 608
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestEventDetail(IIILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "p_type"    # Ljava/lang/String;
    .param p4, "p_id"    # Ljava/lang/String;

    .prologue
    .line 398
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 399
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 400
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 401
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 402
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 407
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestInquirySeller(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "qnaType"    # Ljava/lang/String;
    .param p2, "qna_content"    # Ljava/lang/String;
    .param p3, "email"    # Ljava/lang/String;
    .param p4, "p_type"    # Ljava/lang/String;
    .param p5, "p_id"    # Ljava/lang/String;
    .param p6, "n_id"    # Ljava/lang/String;
    .param p7, "Seller_id"    # Ljava/lang/String;

    .prologue
    .line 759
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 760
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "qna_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 761
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "qna_content"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 762
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "email"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 763
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 764
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 765
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 766
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "seller_id"

    invoke-direct {v2, v3, p7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 774
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestJuminNum(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "adult_pwd"    # Ljava/lang/String;

    .prologue
    .line 1174
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1175
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "jumin"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1177
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestList(III)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I

    .prologue
    .line 425
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 426
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 427
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 430
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestList(IIILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "main_yn"    # Ljava/lang/String;
    .param p4, "n_id"    # Ljava/lang/String;

    .prologue
    .line 503
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 504
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 505
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 506
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "main_yn"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 507
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 512
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestList(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "p_type"    # Ljava/lang/String;
    .param p4, "p_id"    # Ljava/lang/String;
    .param p5, "n_id"    # Ljava/lang/String;

    .prologue
    .line 372
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 373
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 374
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 375
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 376
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 385
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestMusicList(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "main_yn"    # Ljava/lang/String;
    .param p4, "n_id"    # Ljava/lang/String;
    .param p5, "contents_type"    # Ljava/lang/String;

    .prologue
    .line 557
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 558
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 559
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 560
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "main_yn"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 561
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 562
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "contents_type"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 568
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestMyBuyList(IIILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "n_id"    # Ljava/lang/String;

    .prologue
    .line 942
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 943
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 944
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 945
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 950
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestMyOneInquiryReg(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "codeId"    # Ljava/lang/String;
    .param p2, "qnaTitle"    # Ljava/lang/String;
    .param p3, "qnaContent"    # Ljava/lang/String;
    .param p4, "email"    # Ljava/lang/String;
    .param p5, "pno"    # Ljava/lang/String;
    .param p6, "deviceInfo"    # Ljava/lang/String;

    .prologue
    .line 1010
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1011
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "code_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1012
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "qna_title"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1013
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "qna_content"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1014
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "email"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1015
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pno"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1016
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "device_info"

    invoke-direct {v2, v3, p6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1017
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestMyOneQuestionDetail(II)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "qna_id"    # I

    .prologue
    .line 1027
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1028
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "qna_id"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1029
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestMyReplyDel(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "Reply_id"    # Ljava/lang/String;

    .prologue
    .line 974
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 975
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "reply_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 977
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestMyReplyEvaluation(III)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "Requiry_id"    # I
    .param p2, "degree"    # I

    .prologue
    .line 989
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 990
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "requiry_id"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 991
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "degree"

    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 994
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestMySellerDetail(II)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "requiry_id"    # I

    .prologue
    .line 960
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 961
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "requiry_id"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 963
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestNIDList(IIILjava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "n_id"    # Ljava/lang/String;

    .prologue
    .line 480
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 481
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 482
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 483
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 487
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestNotice(ILjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "notice_id"    # Ljava/lang/String;

    .prologue
    .line 1042
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1043
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "notice_id"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1046
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestReplyList(IIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "p_type"    # Ljava/lang/String;
    .param p4, "p_id"    # Ljava/lang/String;
    .param p5, "n_id"    # Ljava/lang/String;

    .prologue
    .line 665
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 666
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 667
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 668
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 669
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 670
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 676
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestReplyRegister(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "p_type"    # Ljava/lang/String;
    .param p2, "p_id"    # Ljava/lang/String;
    .param p3, "n_id"    # Ljava/lang/String;
    .param p4, "content"    # Ljava/lang/String;
    .param p5, "me2_id"    # Ljava/lang/String;
    .param p6, "me2_key"    # Ljava/lang/String;
    .param p7, "tw_id"    # Ljava/lang/String;
    .param p8, "tw_pw"    # Ljava/lang/String;

    .prologue
    .line 696
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 698
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 699
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 700
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 701
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "content"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 706
    if-eqz p5, :cond_0

    .line 708
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "me2_id"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 709
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "me2_key"

    invoke-direct {v2, v3, p6}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 714
    :cond_0
    if-eqz p7, :cond_1

    .line 716
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "tw_id"

    invoke-direct {v2, v3, p7}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 717
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "tw_pw"

    invoke-direct {v2, v3, p8}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 721
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestSellerList(IIILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "page"    # I
    .param p2, "pagesize"    # I
    .param p3, "n_id"    # Ljava/lang/String;
    .param p4, "seller_id"    # Ljava/lang/String;

    .prologue
    .line 733
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 734
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg"

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 735
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pg_size"

    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 736
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 737
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "seller_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 742
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestSnsPwd(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "user_sns_id"    # Ljava/lang/String;
    .param p3, "user_sns_pwd"    # Ljava/lang/String;

    .prologue
    .line 1156
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1157
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1158
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1159
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "pwd"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1163
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestStarScore(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # I
    .param p1, "p_type"    # Ljava/lang/String;
    .param p2, "p_id"    # Ljava/lang/String;
    .param p3, "n_id"    # Ljava/lang/String;
    .param p4, "seller_id"    # Ljava/lang/String;
    .param p5, "starscore"    # I

    .prologue
    .line 639
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 640
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 641
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 642
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 643
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "seller_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 644
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "starscore"

    invoke-static {p5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 651
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestStreaming(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "p_type"    # Ljava/lang/String;
    .param p2, "p_id"    # Ljava/lang/String;
    .param p3, "c_id"    # Ljava/lang/String;
    .param p4, "n_id"    # Ljava/lang/String;
    .param p5, "f_type"    # Ljava/lang/String;

    .prologue
    .line 884
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 885
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 886
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 887
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "c_id"

    invoke-direct {v2, v3, p3}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 888
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "n_id"

    invoke-direct {v2, v3, p4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 889
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "f_type"

    invoke-direct {v2, v3, p5}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 895
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static requestTrandDetail(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "command"    # I
    .param p1, "pType"    # Ljava/lang/String;
    .param p2, "trand_id"    # Ljava/lang/String;

    .prologue
    .line 1182
    invoke-static {p0}, Lcom/kt/olleh/inapp/net/Request;->toURL(I)Ljava/lang/StringBuffer;

    move-result-object v0

    .line 1183
    .local v0, "str":Ljava/lang/StringBuffer;
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "p_type"

    invoke-direct {v2, v3, p1}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1184
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "trand_id"

    invoke-direct {v2, v3, p2}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1187
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/kt/olleh/inapp/net/Request;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static setData(Ljava/lang/String;)V
    .locals 0
    .param p0, "data"    # Ljava/lang/String;

    .prologue
    .line 296
    sput-object p0, Lcom/kt/olleh/inapp/net/Request;->streamData:Ljava/lang/String;

    .line 297
    return-void
.end method

.method public static setDeviceID(Ljava/lang/String;)V
    .locals 0
    .param p0, "id"    # Ljava/lang/String;

    .prologue
    .line 221
    sput-object p0, Lcom/kt/olleh/inapp/net/Request;->mDeviceNumber:Ljava/lang/String;

    .line 222
    return-void
.end method

.method public static setMainURL(Ljava/lang/String;)V
    .locals 0
    .param p0, "mainUrl"    # Ljava/lang/String;

    .prologue
    .line 212
    sput-object p0, Lcom/kt/olleh/inapp/net/Request;->mMainUrl:Ljava/lang/String;

    .line 213
    return-void
.end method

.method private static toString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 1228
    const-string v0, " "

    const-string v1, "%20"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected static toURL(I)Ljava/lang/StringBuffer;
    .locals 5
    .param p0, "command"    # I

    .prologue
    .line 230
    sput p0, Lcom/kt/olleh/inapp/net/Request;->mCommand:I

    .line 232
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 234
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-static {}, Lcom/kt/olleh/inapp/net/Request;->getMainURL()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 235
    invoke-static {}, Lcom/kt/olleh/inapp/net/Request;->getPageUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 236
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    sput-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    .line 240
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "c"

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "phone"

    sget-object v4, Lcom/kt/olleh/inapp/net/Request;->mPhoneNo:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 242
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "dn"

    sget-object v4, Lcom/kt/olleh/inapp/net/Request;->mDeviceNumber:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 243
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "dt"

    sget-object v4, Lcom/kt/olleh/inapp/net/Request;->mDeviceType:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 244
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "model"

    sget-object v4, Lcom/kt/olleh/inapp/net/Request;->mModel:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 245
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "lcd"

    sget-object v4, Lcom/kt/olleh/inapp/net/Request;->mLCDSize:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 246
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "oscv"

    sget-object v4, Lcom/kt/olleh/inapp/net/Request;->mAppVer:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 248
    sget-object v1, Lcom/kt/olleh/inapp/net/Request;->params:Ljava/util/List;

    new-instance v2, Lorg/apache/http/message/BasicNameValuePair;

    const-string v3, "channel"

    sget-object v4, Lcom/kt/olleh/inapp/net/Request;->mChannel:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 258
    return-object v0
.end method
