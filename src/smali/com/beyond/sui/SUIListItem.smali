.class Lcom/beyond/sui/SUIListItem;
.super Lcom/beyond/sui/SUIBase;
.source "SUIListItem.java"


# instance fields
.field image:Landroid/graphics/Bitmap;

.field str:Ljava/lang/String;

.field value:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/beyond/sui/SUIBase;-><init>()V

    return-void
.end method


# virtual methods
.method protected makeContent(Lnanoxml/XMLElement;)Z
    .locals 2
    .param p1, "el"    # Lnanoxml/XMLElement;

    .prologue
    .line 14
    const-string v1, "image"

    invoke-virtual {p1, v1}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 15
    .local v0, "img_path":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 16
    invoke-static {v0}, Lcom/beyond/sui/SUIListItem;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/sui/SUIListItem;->image:Landroid/graphics/Bitmap;

    .line 18
    :cond_0
    const-string v1, "string"

    invoke-virtual {p1, v1}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/sui/SUIListItem;->str:Ljava/lang/String;

    .line 19
    const-string v1, "value"

    invoke-virtual {p1, v1}, Lnanoxml/XMLElement;->getStringAttribute(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/beyond/sui/SUIListItem;->value:Ljava/lang/String;

    .line 20
    iget-object v1, p0, Lcom/beyond/sui/SUIListItem;->value:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 21
    iget-object v1, p0, Lcom/beyond/sui/SUIListItem;->str:Ljava/lang/String;

    iput-object v1, p0, Lcom/beyond/sui/SUIListItem;->value:Ljava/lang/String;

    .line 22
    :cond_1
    const/4 v1, 0x1

    return v1
.end method
