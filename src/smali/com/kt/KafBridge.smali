.class public abstract Lcom/kt/KafBridge;
.super Ljava/lang/Object;
.source "KafBridge.java"


# static fields
.field static final INIT_SUCCESS:Ljava/lang/String; = "kaf init ok"

.field protected static initError:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 14
    const/4 v0, 0x0

    sput v0, Lcom/kt/KafBridge;->initError:I

    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getInitError()I
    .locals 1

    .prologue
    .line 29
    sget v0, Lcom/kt/KafBridge;->initError:I

    return v0
.end method


# virtual methods
.method abstract getInstance()Lcom/kt/KafBridge;
.end method

.method getSysProp(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "cmd"    # Ljava/lang/String;

    .prologue
    .line 25
    const/4 v0, 0x0

    return-object v0
.end method

.method abstract initialize(Landroid/content/Context;Z)Ljava/lang/String;
.end method

.method abstract network_connect()I
.end method

.method abstract network_disconnect()V
.end method
