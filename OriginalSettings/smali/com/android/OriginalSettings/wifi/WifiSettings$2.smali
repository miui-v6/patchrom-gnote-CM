.class Lcom/android/OriginalSettings/wifi/WifiSettings$2;
.super Ljava/lang/Object;
.source "WifiSettings.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/OriginalSettings/wifi/WifiSettings;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/OriginalSettings/wifi/WifiSettings;


# direct methods
.method constructor <init>(Lcom/android/OriginalSettings/wifi/WifiSettings;)V
    .locals 0
    .parameter

    .prologue
    .line 215
    iput-object p1, p0, Lcom/android/OriginalSettings/wifi/WifiSettings$2;->this$0:Lcom/android/OriginalSettings/wifi/WifiSettings;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .parameter "v"

    .prologue
    .line 218
    iget-object v0, p0, Lcom/android/OriginalSettings/wifi/WifiSettings$2;->this$0:Lcom/android/OriginalSettings/wifi/WifiSettings;

    #getter for: Lcom/android/OriginalSettings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;
    invoke-static {v0}, Lcom/android/OriginalSettings/wifi/WifiSettings;->access$200(Lcom/android/OriginalSettings/wifi/WifiSettings;)Landroid/net/wifi/WifiManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->isWifiEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/android/OriginalSettings/wifi/WifiSettings$2;->this$0:Lcom/android/OriginalSettings/wifi/WifiSettings;

    invoke-virtual {v0}, Lcom/android/OriginalSettings/wifi/WifiSettings;->onAddNetworkPressed()V

    .line 221
    :cond_0
    return-void
.end method
