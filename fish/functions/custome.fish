
export VAULT_ADDR="https://vault.adjust.com"
. ~/.ssh/ssh_helper.fish
function renew_vault_login
    echo "Renewing ssh keys"
    # screen -d -m  ~/bin/adjust-openconnect+.sh office
    while true
      curl -s  https://vault.adjust.com > /dev/null 2>&1 && vault_login && break
    end
    # opckill
end

function fra
    set -l server_id $argv[1]
    curl -s --request GET \
        --url https://api.leaseweb.com/bareMetals/v2/servers/$server_id \
        --header 'X-Lsw-Auth: f31b122b-3f4c-4da4-8e3b-f5b56c6b7753'
end

function ams
    set -l server_id $argv[1]
    curl -s --request GET \
        --url https://api.leaseweb.com/bareMetals/v2/servers/$server_id \
        --header 'X-Lsw-Auth: 1f55dccf-b41b-4447-bfe4-3690e47ef022'
end

function lax
    set -l server_id $argv[1]
    curl -s --request GET \
        --url https://api.leaseweb.com/bareMetals/v2/servers/$server_id \
        --header 'X-Lsw-Auth: ee04dd2f-c163-4a8b-994b-12b205f46a87'
end

function esh
    set -l server_id $argv[1]
    curl -s --request GET \
        --url https://api.leaseweb.com/bareMetals/v2/servers/$server_id \
        --header 'X-Lsw-Auth: 3a1d50a9-8798-44a0-b4dd-009b9e9106ea'
end

function network_esh
    set -l equipment_id $argv[1]
    curl -s --request GET \
        --url https://api.leaseweb.com/bareMetals/v2/networkEquipments/$equipment_id \
        --header 'X-Lsw-Auth: 3a1d50a9-8798-44a0-b4dd-009b9e9106ea'
end

function racks_ams
    curl -s --request GET \
        --url 'https://api.leaseweb.com/bareMetals/v2/privateRacks' \
        --header 'x-lsw-auth: 1f55dccf-b41b-4447-bfe4-3690e47ef022'
end

function rack_esh
    set -l rack_id $argv[1]
    curl -s --request GET \
        --url https://api.leaseweb.com/bareMetals/v2/privateRacks/$rack_id \
        --header 'x-lsw-auth: 3a1d50a9-8798-44a0-b4dd-009b9e9106ea'
end

starship init fish | source
source /opt/perlbrew/etc/perlbrew.fish
