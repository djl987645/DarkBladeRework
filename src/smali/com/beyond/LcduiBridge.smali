.class public Lcom/beyond/LcduiBridge;
.super Ljava/lang/Object;
.source "LcduiBridge.java"


# static fields
.field public static final MAIN_LCD:I = 0x1

.field public static final SUB_LCD:I = 0x2

.field private static ime_mode:I

.field static screen_bm:Landroid/graphics/Bitmap;

.field static screen_canvas:Landroid/graphics/Canvas;

.field private static textKeyListener:Landroid/text/method/TextKeyListener;

.field static wipi_bm:Landroid/graphics/Bitmap;

.field static wipi_canvas:Landroid/graphics/Canvas;


# instance fields
.field protected h:I

.field protected w:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 21
    const/4 v0, 0x0

    sput v0, Lcom/beyond/LcduiBridge;->ime_mode:I

    .line 23
    sput-object v1, Lcom/beyond/LcduiBridge;->screen_canvas:Landroid/graphics/Canvas;

    .line 24
    sput-object v1, Lcom/beyond/LcduiBridge;->wipi_canvas:Landroid/graphics/Canvas;

    .line 31
    sput-object v1, Lcom/beyond/LcduiBridge;->textKeyListener:Landroid/text/method/TextKeyListener;

    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private flushAnnun()V
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 62
    new-instance v5, Landroid/graphics/Paint;

    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 63
    .local v5, "paint":Landroid/graphics/Paint;
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v0

    iget v0, v0, Lcom/beyond/screen/AnnunInfo;->bg:I

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 64
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v5, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 65
    sget-object v0, Lcom/beyond/LcduiBridge;->screen_canvas:Landroid/graphics/Canvas;

    const/4 v2, 0x1

    invoke-virtual {p0, v2}, Lcom/beyond/LcduiBridge;->getWidth0(I)I

    move-result v2

    int-to-float v3, v2

    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v2

    iget v2, v2, Lcom/beyond/screen/AnnunInfo;->height:I

    int-to-float v4, v2

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 66
    return-void
.end method

.method static getBitsPerPixelAn()I
    .locals 2

    .prologue
    .line 129
    new-instance v0, Landroid/graphics/PixelFormat;

    invoke-direct {v0}, Landroid/graphics/PixelFormat;-><init>()V

    .line 130
    .local v0, "pf":Landroid/graphics/PixelFormat;
    const/4 v1, 0x4

    invoke-static {v1, v0}, Landroid/graphics/PixelFormat;->getPixelFormatInfo(ILandroid/graphics/PixelFormat;)V

    .line 131
    iget v1, v0, Landroid/graphics/PixelFormat;->bitsPerPixel:I

    return v1
.end method

.method public static getCurrentMode()I
    .locals 1

    .prologue
    .line 154
    sget v0, Lcom/beyond/LcduiBridge;->ime_mode:I

    return v0
.end method

.method public static getSurpportImeModes()[Ljava/lang/String;
    .locals 7

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 140
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    .line 141
    .local v0, "locale":Ljava/util/Locale;
    sget-object v2, Ljava/util/Locale;->KOREA:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    sget-object v2, Ljava/util/Locale;->KOREAN:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 142
    :cond_0
    const/4 v2, 0x4

    new-array v1, v2, [Ljava/lang/String;

    const-string v2, "EN/S"

    aput-object v2, v1, v3

    const-string v2, "EN/L"

    aput-object v2, v1, v4

    const-string v2, "N123"

    aput-object v2, v1, v5

    const-string v2, "KO"

    aput-object v2, v1, v6

    .line 145
    .local v1, "modeCode":[Ljava/lang/String;
    :goto_0
    return-object v1

    .line 144
    .end local v1    # "modeCode":[Ljava/lang/String;
    :cond_1
    new-array v1, v6, [Ljava/lang/String;

    const-string v2, "EN/S"

    aput-object v2, v1, v3

    const-string v2, "EN/L"

    aput-object v2, v1, v4

    const-string v2, "N123"

    aput-object v2, v1, v5

    .restart local v1    # "modeCode":[Ljava/lang/String;
    goto :goto_0
.end method

.method public static handleKeyInput(II[I[B[B)I
    .locals 11
    .param p0, "keyC"    # I
    .param p1, "type"    # I
    .param p2, "size"    # [I
    .param p3, "complete"    # [B
    .param p4, "compose"    # [B

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 87
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "handleKeyInput("

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ","

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ")"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 88
    sget-object v5, Lcom/beyond/LcduiBridge;->textKeyListener:Landroid/text/method/TextKeyListener;

    if-nez v5, :cond_0

    .line 89
    invoke-static {}, Landroid/text/method/TextKeyListener;->getInstance()Landroid/text/method/TextKeyListener;

    move-result-object v5

    sput-object v5, Lcom/beyond/LcduiBridge;->textKeyListener:Landroid/text/method/TextKeyListener;

    .line 93
    :cond_0
    const/4 v3, 0x0

    .line 94
    .local v3, "result":I
    invoke-static {}, Landroid/text/Editable$Factory;->getInstance()Landroid/text/Editable$Factory;

    move-result-object v5

    const-string v6, ""

    invoke-virtual {v5, v6}, Landroid/text/Editable$Factory;->newEditable(Ljava/lang/CharSequence;)Landroid/text/Editable;

    move-result-object v1

    .line 96
    .local v1, "editable":Landroid/text/Editable;
    const/16 v5, -0x63

    if-ne p0, v5, :cond_1

    .line 97
    invoke-static {v1}, Landroid/text/method/TextKeyListener;->clear(Landroid/text/Editable;)V

    .line 99
    const/4 v3, 0x1

    move v4, v3

    .line 125
    .end local v3    # "result":I
    .local v4, "result":I
    :goto_0
    return v4

    .line 103
    .end local v4    # "result":I
    .restart local v3    # "result":I
    :cond_1
    invoke-static {p0}, Lcom/beyond/JletActivity;->getAnKeyCode(I)I

    move-result v0

    .line 106
    .local v0, "anKeyCd":I
    if-ne p1, v9, :cond_4

    .line 108
    sget-object v5, Lcom/beyond/LcduiBridge;->textKeyListener:Landroid/text/method/TextKeyListener;

    new-instance v6, Landroid/view/KeyEvent;

    invoke-direct {v6, v8, v0}, Landroid/view/KeyEvent;-><init>(II)V

    invoke-virtual {v5, v10, v1, v0, v6}, Landroid/text/method/TextKeyListener;->onKeyDown(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 109
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v5

    if-lt v2, v5, :cond_3

    .line 112
    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v5

    aput v5, p2, v8

    .line 113
    const/4 v3, 0x1

    .end local v2    # "i":I
    :cond_2
    :goto_2
    move v4, v3

    .line 125
    .end local v3    # "result":I
    .restart local v4    # "result":I
    goto :goto_0

    .line 110
    .end local v4    # "result":I
    .restart local v2    # "i":I
    .restart local v3    # "result":I
    :cond_3
    invoke-interface {v1, v2}, Landroid/text/Editable;->charAt(I)C

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, p3, v2

    .line 109
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 116
    .end local v2    # "i":I
    :cond_4
    const/4 v5, 0x2

    if-ne p1, v5, :cond_2

    .line 117
    sget-object v5, Lcom/beyond/LcduiBridge;->textKeyListener:Landroid/text/method/TextKeyListener;

    new-instance v6, Landroid/view/KeyEvent;

    invoke-direct {v6, v9, v0}, Landroid/view/KeyEvent;-><init>(II)V

    invoke-virtual {v5, v10, v1, v0, v6}, Landroid/text/method/TextKeyListener;->onKeyUp(Landroid/view/View;Landroid/text/Editable;ILandroid/view/KeyEvent;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 118
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_3
    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v5

    if-lt v2, v5, :cond_5

    .line 120
    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v5

    aput v5, p2, v8

    .line 122
    const/4 v3, 0x1

    goto :goto_2

    .line 119
    :cond_5
    invoke-interface {v1, v2}, Landroid/text/Editable;->charAt(I)C

    move-result v5

    int-to-byte v5, v5

    aput-byte v5, p3, v2

    .line 118
    add-int/lit8 v2, v2, 0x1

    goto :goto_3
.end method

.method public static setCurrentMode(I)I
    .locals 1
    .param p0, "mode"    # I

    .prologue
    .line 149
    sput p0, Lcom/beyond/LcduiBridge;->ime_mode:I

    .line 150
    sget v0, Lcom/beyond/LcduiBridge;->ime_mode:I

    return v0
.end method


# virtual methods
.method public flushFB(Lcom/beyond/ImageBridge;IZIIIII)V
    .locals 9
    .param p1, "img"    # Lcom/beyond/ImageBridge;
    .param p2, "fbBPL"    # I
    .param p3, "bTrans"    # Z
    .param p4, "screen"    # I
    .param p5, "x"    # I
    .param p6, "y"    # I
    .param p7, "w"    # I
    .param p8, "h"    # I

    .prologue
    .line 70
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 71
    .local v1, "paint":Landroid/graphics/Paint;
    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v2

    iget v0, v2, Lcom/beyond/screen/AnnunInfo;->height:I

    .line 73
    .local v0, "anh":I
    const/4 v2, 0x1

    if-ne p4, v2, :cond_0

    .line 74
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    monitor-enter v3

    .line 76
    :try_start_0
    sget-object v2, Lcom/beyond/LcduiBridge;->wipi_canvas:Landroid/graphics/Canvas;

    iget-object v4, p1, Lcom/beyond/ImageBridge;->bm:Landroid/graphics/Bitmap;

    new-instance v5, Landroid/graphics/Rect;

    add-int v6, p5, p7

    add-int v7, p6, p8

    invoke-direct {v5, p5, p6, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    new-instance v6, Landroid/graphics/Rect;

    add-int v7, p5, p7

    add-int v8, p6, p8

    invoke-direct {v6, p5, p6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v2, v4, v5, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 77
    sget-object v2, Lcom/beyond/LcduiBridge;->screen_canvas:Landroid/graphics/Canvas;

    sget-object v4, Lcom/beyond/LcduiBridge;->wipi_bm:Landroid/graphics/Bitmap;

    new-instance v5, Landroid/graphics/Rect;

    add-int v6, p5, p7

    add-int v7, p6, p8

    invoke-direct {v5, p5, p6, v6, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 78
    new-instance v6, Landroid/graphics/Rect;

    add-int v7, p5, p7

    add-int v8, p6, p8

    invoke-direct {v6, p5, p6, v7, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 77
    invoke-virtual {v2, v4, v5, v6, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 74
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    sget-object v2, Lcom/beyond/JletActivity;->view:Lcom/beyond/JletView;

    invoke-virtual {v2}, Lcom/beyond/JletView;->postInvalidate()V

    .line 84
    :cond_0
    return-void

    .line 74
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method protected getBitsPerPixel0(I)I
    .locals 1
    .param p1, "screen"    # I

    .prologue
    .line 135
    invoke-static {}, Lcom/beyond/LcduiBridge;->getBitsPerPixelAn()I

    move-result v0

    return v0
.end method

.method protected getHeight0(I)I
    .locals 3
    .param p1, "screen"    # I

    .prologue
    .line 53
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 54
    invoke-static {}, Lcom/beyond/JletActivity;->getGameDisplaySize()Landroid/graphics/Point;

    move-result-object v0

    .line 55
    .local v0, "p":Landroid/graphics/Point;
    iget v1, v0, Landroid/graphics/Point;->y:I

    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v2

    iget v2, v2, Lcom/beyond/screen/AnnunInfo;->height:I

    sub-int/2addr v1, v2

    .line 58
    .end local v0    # "p":Landroid/graphics/Point;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected getWidth0(I)I
    .locals 2
    .param p1, "screen"    # I

    .prologue
    .line 44
    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 45
    invoke-static {}, Lcom/beyond/JletActivity;->getGameDisplaySize()Landroid/graphics/Point;

    move-result-object v0

    .line 46
    .local v0, "p":Landroid/graphics/Point;
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 49
    .end local v0    # "p":Landroid/graphics/Point;
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected init(I)V
    .locals 3
    .param p1, "screen_id"    # I

    .prologue
    .line 34
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 35
    iget v0, p0, Lcom/beyond/LcduiBridge;->w:I

    iget v1, p0, Lcom/beyond/LcduiBridge;->h:I

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/beyond/LcduiBridge;->wipi_bm:Landroid/graphics/Bitmap;

    .line 36
    new-instance v0, Landroid/graphics/Canvas;

    sget-object v1, Lcom/beyond/LcduiBridge;->wipi_bm:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    sput-object v0, Lcom/beyond/LcduiBridge;->wipi_canvas:Landroid/graphics/Canvas;

    .line 37
    iget v0, p0, Lcom/beyond/LcduiBridge;->w:I

    iget v1, p0, Lcom/beyond/LcduiBridge;->h:I

    invoke-static {}, Lcom/beyond/screen/ScreenConfig;->getAnnunInfo()Lcom/beyond/screen/AnnunInfo;

    move-result-object v2

    iget v2, v2, Lcom/beyond/screen/AnnunInfo;->height:I

    add-int/2addr v1, v2

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    sput-object v0, Lcom/beyond/LcduiBridge;->screen_bm:Landroid/graphics/Bitmap;

    .line 38
    new-instance v0, Landroid/graphics/Canvas;

    sget-object v1, Lcom/beyond/LcduiBridge;->screen_bm:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    sput-object v0, Lcom/beyond/LcduiBridge;->screen_canvas:Landroid/graphics/Canvas;

    .line 40
    :cond_0
    return-void
.end method
