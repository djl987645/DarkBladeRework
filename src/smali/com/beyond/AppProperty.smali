.class public Lcom/beyond/AppProperty;
.super Ljava/lang/Object;
.source "AppProperty.java"


# static fields
.field private static appPropXml:Lnanoxml/XMLElement; = null

.field private static final configFileName:Ljava/lang/String; = "res_pad/property.cfg"

.field private static instance:Lcom/beyond/AppProperty;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 13
    sput-object v0, Lcom/beyond/AppProperty;->instance:Lcom/beyond/AppProperty;

    .line 14
    sput-object v0, Lcom/beyond/AppProperty;->appPropXml:Lnanoxml/XMLElement;

    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/beyond/JletActivity;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/beyond/AppProperty;->loadConfig(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 25
    :cond_0
    :goto_0
    return-void

    .line 21
    :cond_1
    sget-object v0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    if-eqz v0, :cond_2

    sget-object v0, Lcom/beyond/CletActivity;->context:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/beyond/AppProperty;->loadConfig(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 24
    :cond_2
    const/4 v0, 0x0

    sput-object v0, Lcom/beyond/AppProperty;->appPropXml:Lnanoxml/XMLElement;

    goto :goto_0
.end method

.method private static getInst()Lcom/beyond/AppProperty;
    .locals 1

    .prologue
    .line 28
    sget-object v0, Lcom/beyond/AppProperty;->instance:Lcom/beyond/AppProperty;

    if-nez v0, :cond_0

    .line 29
    new-instance v0, Lcom/beyond/AppProperty;

    invoke-direct {v0}, Lcom/beyond/AppProperty;-><init>()V

    sput-object v0, Lcom/beyond/AppProperty;->instance:Lcom/beyond/AppProperty;

    .line 31
    :cond_0
    sget-object v0, Lcom/beyond/AppProperty;->instance:Lcom/beyond/AppProperty;

    return-object v0
.end method

.method public static getInt(Ljava/lang/String;)I
    .locals 5
    .param p0, "command"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 36
    invoke-static {}, Lcom/beyond/AppProperty;->getInst()Lcom/beyond/AppProperty;

    sget-object v4, Lcom/beyond/AppProperty;->appPropXml:Lnanoxml/XMLElement;

    if-nez v4, :cond_1

    .line 47
    :cond_0
    :goto_0
    return v3

    .line 39
    :cond_1
    invoke-static {}, Lcom/beyond/AppProperty;->getInst()Lcom/beyond/AppProperty;

    sget-object v4, Lcom/beyond/AppProperty;->appPropXml:Lnanoxml/XMLElement;

    invoke-virtual {v4}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v2

    .line 40
    .local v2, "v":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 41
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 42
    .local v0, "el":Lnanoxml/XMLElement;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 43
    const-string v3, "value"

    invoke-virtual {v0, v3}, Lnanoxml/XMLElement;->getIntAttribute(Ljava/lang/String;)I

    move-result v3

    goto :goto_0
.end method

.method public static getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "command"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 80
    invoke-static {}, Lcom/beyond/AppProperty;->getInst()Lcom/beyond/AppProperty;

    sget-object v4, Lcom/beyond/AppProperty;->appPropXml:Lnanoxml/XMLElement;

    if-nez v4, :cond_1

    .line 90
    :cond_0
    :goto_0
    return-object v3

    .line 83
    :cond_1
    invoke-static {}, Lcom/beyond/AppProperty;->getInst()Lcom/beyond/AppProperty;

    sget-object v4, Lcom/beyond/AppProperty;->appPropXml:Lnanoxml/XMLElement;

    invoke-virtual {v4}, Lnanoxml/XMLElement;->getChildren()Ljava/util/Vector;

    move-result-object v2

    .line 84
    .local v2, "v":Ljava/util/Vector;
    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_2
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 85
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnanoxml/XMLElement;

    .line 86
    .local v0, "el":Lnanoxml/XMLElement;
    invoke-virtual {v0}, Lnanoxml/XMLElement;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 87
    const-string v3, "value"

    invoke-virtual {v0, v3}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private loadConfig(Landroid/content/Context;)Z
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    const/4 v5, 0x1

    .line 52
    const-string v3, ""

    .line 53
    .local v3, "xml":Ljava/lang/String;
    const/4 v2, 0x0

    .line 55
    .local v2, "is":Ljava/io/InputStream;
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "res_pad/property.cfg"

    const/4 v8, 0x1

    invoke-virtual {v6, v7, v8}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;

    move-result-object v2

    .line 56
    if-nez v2, :cond_1

    .line 76
    :goto_0
    return v4

    .line 60
    :cond_0
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v6

    new-array v0, v6, [B

    .line 61
    .local v0, "b":[B
    invoke-virtual {v2, v0}, Ljava/io/InputStream;->read([B)I

    .line 62
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/lang/String;

    invoke-direct {v7, v0}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 59
    .end local v0    # "b":[B
    :cond_1
    invoke-virtual {v2}, Ljava/io/InputStream;->available()I

    move-result v6

    if-gtz v6, :cond_0

    .line 64
    new-instance v6, Lnanoxml/XMLElement;

    invoke-direct {v6}, Lnanoxml/XMLElement;-><init>()V

    sput-object v6, Lcom/beyond/AppProperty;->appPropXml:Lnanoxml/XMLElement;

    .line 65
    sget-object v6, Lcom/beyond/AppProperty;->appPropXml:Lnanoxml/XMLElement;

    invoke-virtual {v6, v3}, Lnanoxml/XMLElement;->parseString(Ljava/lang/String;)V
    :try_end_0
    .catch Lnanoxml/XMLParseException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v4, v5

    .line 66
    goto :goto_0

    .line 69
    :catch_0
    move-exception v1

    .line 71
    .local v1, "e":Ljava/lang/Exception;
    goto :goto_0

    .line 67
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v4

    move v4, v5

    .line 76
    goto :goto_0
.end method
