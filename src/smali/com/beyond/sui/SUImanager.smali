.class public Lcom/beyond/sui/SUImanager;
.super Ljava/lang/Object;
.source "SUImanager.java"


# static fields
.field static final ATTRIBUTE_VISIBLE:I = 0x0

.field static final COMPTYPE_BUTTON:I = 0x9

.field static final COMPTYPE_COMP:I = 0x2

.field static final COMPTYPE_CUR_VIEWNAME:I = 0x6

.field static final COMPTYPE_LIST:I = 0x4

.field static final COMPTYPE_LIST_SELECTED:I = 0x5

.field public static final COMPTYPE_SWIP:I = 0xa

.field public static final COMPTYPE_SWIP_TEXT:I = 0xb

.field static final COMPTYPE_SWITCH:I = 0x8

.field static final COMPTYPE_TEXT:I = 0x3

.field static final COMPTYPE_TEXT_STRING:I = 0x7

.field static final COMPTYPE_VIEW:I = 0x1

.field private static final USING_CURRENT_VIEW:Z = true

.field private static currentView:Lcom/beyond/sui/SUIView;

.field private static instance:Lcom/beyond/sui/SUImanager;

.field private static isClet:Z

.field private static parent:Landroid/view/View;


# instance fields
.field private annun_img:Landroid/graphics/Bitmap;

.field private annun_rect:Landroid/graphics/Rect;

.field mx:I

.field my:I

.field private views:Ljava/util/Vector;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 45
    sput-object v0, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    .line 47
    sput-object v0, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    .line 48
    sput-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    .line 51
    const/4 v0, 0x0

    sput-boolean v0, Lcom/beyond/sui/SUImanager;->isClet:Z

    .line 28
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 84
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUImanager;->views:Ljava/util/Vector;

    .line 49
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Lcom/beyond/sui/SUImanager;->annun_rect:Landroid/graphics/Rect;

    .line 50
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/beyond/sui/SUImanager;->annun_img:Landroid/graphics/Bitmap;

    .line 114
    iput v1, p0, Lcom/beyond/sui/SUImanager;->mx:I

    .line 115
    iput v1, p0, Lcom/beyond/sui/SUImanager;->my:I

    .line 86
    return-void
.end method

.method private findComponent(Ljava/lang/String;)Lcom/beyond/sui/SUIView;
    .locals 3
    .param p1, "xmlPath"    # Ljava/lang/String;

    .prologue
    .line 264
    iget-object v2, p0, Lcom/beyond/sui/SUImanager;->views:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->elements()Ljava/util/Enumeration;

    move-result-object v1

    .local v1, "en":Ljava/util/Enumeration;
    :cond_0
    invoke-interface {v1}, Ljava/util/Enumeration;->hasMoreElements()Z

    move-result v2

    if-nez v2, :cond_1

    .line 269
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 265
    :cond_1
    invoke-interface {v1}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/beyond/sui/SUIView;

    .line 266
    .local v0, "el":Lcom/beyond/sui/SUIView;
    iget-object v2, v0, Lcom/beyond/sui/SUIView;->xmlPath:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0
.end method

.method protected static getInputStream(Ljava/lang/String;)Ljava/io/InputStream;
    .locals 6
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    const/16 v5, 0x2f

    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 344
    if-nez p0, :cond_0

    .line 345
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "name is null"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 347
    :cond_0
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v5, :cond_1

    .line 348
    invoke-virtual {p0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 356
    :cond_1
    :try_start_0
    sget-object v2, Lcom/beyond/BeyondActivity;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, p0, v3}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;I)Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 362
    .local v1, "is":Ljava/io/InputStream;
    :goto_0
    return-object v1

    .line 357
    .end local v1    # "is":Ljava/io/InputStream;
    :catch_0
    move-exception v0

    .line 358
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v5, :cond_2

    .line 359
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 360
    :cond_2
    invoke-static {}, Lcom/beyond/JletActivity;->getCurrentJlet()Lcom/beyond/JletBridge;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/Class;->getResourceAsStream(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v1

    .restart local v1    # "is":Ljava/io/InputStream;
    goto :goto_0
.end method

.method public static getInstance(Ljava/lang/Object;)Lcom/beyond/sui/SUImanager;
    .locals 4
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 54
    sget-object v1, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    if-nez v1, :cond_0

    .line 55
    new-instance v1, Lcom/beyond/sui/SUImanager;

    invoke-direct {v1}, Lcom/beyond/sui/SUImanager;-><init>()V

    sput-object v1, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    .line 58
    :cond_0
    if-eqz p0, :cond_1

    sget-object v1, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    if-nez v1, :cond_1

    .line 59
    check-cast p0, Landroid/view/View;

    .end local p0    # "o":Ljava/lang/Object;
    sput-object p0, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    .line 62
    :cond_1
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v0

    .line 63
    .local v0, "annun":Lcom/beyond/screen/AnnunInfo;
    if-eqz v0, :cond_2

    .line 64
    sget-object v1, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    iget-object v2, v0, Lcom/beyond/screen/AnnunInfo;->img_path:Ljava/lang/String;

    iget-object v3, v0, Lcom/beyond/screen/AnnunInfo;->img_rc:Landroid/graphics/Rect;

    invoke-virtual {v1, v2, v3}, Lcom/beyond/sui/SUImanager;->setAnnunInfo(Ljava/lang/String;Landroid/graphics/Rect;)V

    .line 65
    :cond_2
    sget-object v1, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    return-object v1
.end method

.method public static getInstance(Ljava/lang/Object;Z)Lcom/beyond/sui/SUImanager;
    .locals 4
    .param p0, "o"    # Ljava/lang/Object;
    .param p1, "Clet"    # Z

    .prologue
    .line 69
    sget-object v1, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    if-nez v1, :cond_0

    .line 70
    new-instance v1, Lcom/beyond/sui/SUImanager;

    invoke-direct {v1}, Lcom/beyond/sui/SUImanager;-><init>()V

    sput-object v1, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    .line 73
    :cond_0
    sput-boolean p1, Lcom/beyond/sui/SUImanager;->isClet:Z

    .line 74
    if-eqz p0, :cond_1

    sget-object v1, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    if-nez v1, :cond_1

    .line 75
    check-cast p0, Landroid/view/View;

    .end local p0    # "o":Ljava/lang/Object;
    sput-object p0, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    .line 78
    :cond_1
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v0

    .line 79
    .local v0, "annun":Lcom/beyond/screen/AnnunInfo;
    if-eqz v0, :cond_2

    .line 80
    sget-object v1, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    iget-object v2, v0, Lcom/beyond/screen/AnnunInfo;->img_path:Ljava/lang/String;

    iget-object v3, v0, Lcom/beyond/screen/AnnunInfo;->img_rc:Landroid/graphics/Rect;

    invoke-virtual {v1, v2, v3}, Lcom/beyond/sui/SUImanager;->setAnnunInfo(Ljava/lang/String;Landroid/graphics/Rect;)V

    .line 81
    :cond_2
    sget-object v1, Lcom/beyond/sui/SUImanager;->instance:Lcom/beyond/sui/SUImanager;

    return-object v1
.end method

.method static printd(Ljava/lang/String;)V
    .locals 1
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 329
    sget v0, Lcom/beyond/sui/SUIBase;->debug_level:I

    if-lez v0, :cond_0

    .line 330
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    invoke-virtual {v0, p0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 331
    :cond_0
    return-void
.end method

.method private repaintViews()V
    .locals 0

    .prologue
    .line 315
    return-void
.end method

.method public static sendWipiKeyEvent(II)V
    .locals 1
    .param p0, "action"    # I
    .param p1, "key"    # I

    .prologue
    .line 338
    sget-boolean v0, Lcom/beyond/sui/SUImanager;->isClet:Z

    if-nez v0, :cond_0

    .line 339
    invoke-static {p0, p1}, Lcom/beyond/JletActivity;->sendWipiKeyEvent(II)V

    .line 342
    :goto_0
    return-void

    .line 341
    :cond_0
    invoke-static {p0, p1}, Lcom/beyond/CletActivity;->sendWipiKeyEvent(II)V

    goto :goto_0
.end method

.method static showPadButton(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Boolean;)V
    .locals 0
    .param p0, "padName"    # Ljava/lang/String;
    .param p1, "buttonName"    # Ljava/lang/String;
    .param p2, "bShow"    # Ljava/lang/Boolean;

    .prologue
    .line 335
    return-void
.end method


# virtual methods
.method public getSUIBaseByName(Ljava/lang/String;)Lcom/beyond/sui/SUIBase;
    .locals 1
    .param p1, "suiName"    # Ljava/lang/String;

    .prologue
    .line 366
    const/4 v0, 0x0

    .line 376
    .local v0, "suiBase":Lcom/beyond/sui/SUIBase;
    return-object v0
.end method

.method public getValue(ILjava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 277
    sget-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-nez v0, :cond_0

    .line 278
    const/4 v0, 0x0

    .line 280
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    invoke-virtual {v0, p1, p2}, Lcom/beyond/sui/SUIView;->onGetValue(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public hide(Ljava/lang/String;)V
    .locals 2
    .param p1, "xmlPath"    # Ljava/lang/String;

    .prologue
    .line 237
    invoke-direct {p0, p1}, Lcom/beyond/sui/SUImanager;->findComponent(Ljava/lang/String;)Lcom/beyond/sui/SUIView;

    move-result-object v0

    .line 238
    .local v0, "el":Lcom/beyond/sui/SUIView;
    if-nez v0, :cond_1

    .line 246
    :cond_0
    :goto_0
    return-void

    .line 241
    :cond_1
    iget-object v1, p0, Lcom/beyond/sui/SUImanager;->views:Ljava/util/Vector;

    invoke-virtual {v1, v0}, Ljava/util/Vector;->remove(Ljava/lang/Object;)Z

    .line 242
    sget-object v1, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-ne v0, v1, :cond_2

    .line 243
    const/4 v1, 0x0

    sput-object v1, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    .line 244
    :cond_2
    sget-object v1, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    if-eqz v1, :cond_0

    sget-boolean v1, Lcom/beyond/sui/SUImanager;->isClet:Z

    if-nez v1, :cond_0

    .line 245
    sget-object v1, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->postInvalidate()V

    goto :goto_0
.end method

.method public hideAll()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 249
    sget-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-nez v0, :cond_0

    .line 261
    :goto_0
    return-void

    .line 252
    :cond_0
    iget-object v0, p0, Lcom/beyond/sui/SUImanager;->views:Ljava/util/Vector;

    invoke-virtual {v0}, Ljava/util/Vector;->removeAllElements()V

    .line 253
    sput-object v1, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    .line 254
    sget-object v0, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    if-eqz v0, :cond_1

    sget-boolean v0, Lcom/beyond/sui/SUImanager;->isClet:Z

    if-nez v0, :cond_1

    .line 255
    sget-object v0, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->postInvalidate()V

    .line 257
    :cond_1
    invoke-static {}, Lcom/beyond/sui/SUIFont;->unloadAll()V

    .line 258
    invoke-static {}, Lcom/beyond/ad/AdMgr;->isSupport()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 259
    const/4 v0, 0x0

    invoke-static {v0, v1}, Lcom/beyond/BeyondActivity;->requestAdView(ZLandroid/graphics/Rect;)V

    .line 260
    :cond_2
    invoke-static {}, Lcom/beyond/BeyondActivity;->onHideSUI()V

    goto :goto_0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;Landroid/view/View;)Z
    .locals 9
    .param p1, "event"    # Landroid/view/MotionEvent;
    .param p2, "jc"    # Landroid/view/View;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v8, -0x1

    .line 120
    sget-object v7, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-nez v7, :cond_1

    .line 191
    :cond_0
    :goto_0
    return v5

    .line 127
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    .line 129
    .local v0, "action":I
    if-nez v0, :cond_3

    .line 130
    const/4 v2, 0x1

    .line 131
    .local v2, "state":I
    iput v8, p0, Lcom/beyond/sui/SUImanager;->mx:I

    .line 132
    iput v8, p0, Lcom/beyond/sui/SUImanager;->my:I

    .line 157
    :goto_1
    sget-object v7, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-eqz v7, :cond_0

    .line 159
    sget-object v7, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    sget-object v8, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    iget-object v8, v8, Lcom/beyond/sui/SUIView;->rect:Landroid/graphics/Rect;

    invoke-virtual {v7, p1, v8, v2, p2}, Lcom/beyond/sui/SUIView;->onTouchEvent(Landroid/view/MotionEvent;Landroid/graphics/Rect;ILandroid/view/View;)I

    move-result v1

    .line 160
    .local v1, "ret":I
    if-eqz v1, :cond_0

    .line 165
    sget-boolean v5, Lcom/beyond/sui/SUImanager;->isClet:Z

    if-nez v5, :cond_2

    .line 166
    invoke-virtual {p2}, Landroid/view/View;->invalidate()V

    :cond_2
    move v5, v6

    .line 168
    goto :goto_0

    .line 134
    .end local v1    # "ret":I
    .end local v2    # "state":I
    :cond_3
    if-ne v0, v6, :cond_4

    .line 135
    const/4 v2, 0x2

    .line 136
    .restart local v2    # "state":I
    iput v8, p0, Lcom/beyond/sui/SUImanager;->mx:I

    .line 137
    iput v8, p0, Lcom/beyond/sui/SUImanager;->my:I

    goto :goto_1

    .line 139
    .end local v2    # "state":I
    :cond_4
    const/4 v7, 0x2

    if-ne v0, v7, :cond_6

    .line 140
    const/4 v2, 0x5

    .line 141
    .restart local v2    # "state":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result v7

    float-to-int v3, v7

    .line 142
    .local v3, "x":I
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    move-result v7

    float-to-int v4, v7

    .line 143
    .local v4, "y":I
    iget v7, p0, Lcom/beyond/sui/SUImanager;->mx:I

    add-int/lit8 v7, v7, -0x4

    if-gt v7, v3, :cond_5

    iget v7, p0, Lcom/beyond/sui/SUImanager;->mx:I

    add-int/lit8 v7, v7, 0x4

    if-lt v7, v3, :cond_5

    iget v7, p0, Lcom/beyond/sui/SUImanager;->my:I

    add-int/lit8 v7, v7, -0x4

    if-gt v7, v4, :cond_5

    iget v7, p0, Lcom/beyond/sui/SUImanager;->my:I

    add-int/lit8 v7, v7, 0x4

    if-lt v7, v4, :cond_5

    move v5, v6

    .line 144
    goto :goto_0

    .line 147
    :cond_5
    iput v3, p0, Lcom/beyond/sui/SUImanager;->mx:I

    .line 148
    iput v4, p0, Lcom/beyond/sui/SUImanager;->my:I

    goto :goto_1

    .line 151
    .end local v2    # "state":I
    .end local v3    # "x":I
    .end local v4    # "y":I
    :cond_6
    iput v8, p0, Lcom/beyond/sui/SUImanager;->mx:I

    .line 152
    iput v8, p0, Lcom/beyond/sui/SUImanager;->my:I

    goto :goto_0
.end method

.method public paint(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "g"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v1, 0x1

    .line 89
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 90
    .local v0, "paint":Landroid/graphics/Paint;
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 91
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 101
    sget-object v1, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-eqz v1, :cond_0

    .line 103
    sget-object v1, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    sget-object v2, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    iget-object v2, v2, Lcom/beyond/sui/SUIView;->rect:Landroid/graphics/Rect;

    invoke-virtual {v1, p1, v2, v0}, Lcom/beyond/sui/SUIView;->paint(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 112
    :cond_0
    return-void
.end method

.method setAnnunInfo(Ljava/lang/String;Landroid/graphics/Rect;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "rc"    # Landroid/graphics/Rect;

    .prologue
    .line 293
    invoke-static {p1}, Lcom/beyond/sui/SUIBase;->loadImage(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/beyond/sui/SUImanager;->annun_img:Landroid/graphics/Bitmap;

    .line 294
    iput-object p2, p0, Lcom/beyond/sui/SUImanager;->annun_rect:Landroid/graphics/Rect;

    .line 295
    return-void
.end method

.method setDebug(I)V
    .locals 0
    .param p1, "level"    # I

    .prologue
    .line 273
    sput p1, Lcom/beyond/sui/SUIBase;->debug_level:I

    .line 274
    return-void
.end method

.method setSuiAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "cmpName"    # Ljava/lang/String;
    .param p2, "attr"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 387
    sget-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-eqz v0, :cond_0

    .line 388
    sget-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIView;->setSuiAttribute(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    .line 390
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setValue(ILjava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "componentType"    # I
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "v"    # Ljava/lang/String;

    .prologue
    .line 284
    sget-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-nez v0, :cond_0

    .line 285
    const/4 v0, 0x0

    .line 287
    :goto_0
    return v0

    :cond_0
    sget-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    invoke-virtual {v0, p1, p2, p3}, Lcom/beyond/sui/SUIView;->onSetValue(ILjava/lang/String;Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public show(Ljava/lang/String;)V
    .locals 2
    .param p1, "xmlPath"    # Ljava/lang/String;

    .prologue
    .line 198
    sget-object v1, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    if-eqz v1, :cond_1

    sget-object v1, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    iget-object v1, v1, Lcom/beyond/sui/SUIView;->xmlPath:Ljava/lang/String;

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 234
    :cond_0
    :goto_0
    return-void

    .line 202
    :cond_1
    new-instance v0, Lcom/beyond/sui/SUIView;

    invoke-direct {v0}, Lcom/beyond/sui/SUIView;-><init>()V

    .line 205
    .local v0, "el":Lcom/beyond/sui/SUIView;
    sget-object v1, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lcom/beyond/sui/SUIView;->loadXml(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 208
    sput-object v0, Lcom/beyond/sui/SUImanager;->currentView:Lcom/beyond/sui/SUIView;

    .line 209
    sget-object v1, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    if-eqz v1, :cond_0

    sget-boolean v1, Lcom/beyond/sui/SUImanager;->isClet:Z

    if-nez v1, :cond_0

    .line 210
    sget-object v1, Lcom/beyond/sui/SUImanager;->parent:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->postInvalidate()V

    goto :goto_0
.end method
