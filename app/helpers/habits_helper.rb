module HabitsHelper

    def award_badge(award)
        case award.name
        when 'medal'
            image_tag('medal.png', alt:'medal icon', width: '30', oncontextmenu: 'return false;')
        when 'plaque'
            image_tag('plaque.png', alt:'plaque icon', width: '30', oncontextmenu: 'return false;')
        when 'bronze'
            image_tag('bronze.png', alt:'bronze icon', width: '30', oncontextmenu: 'return false;')
        when 'silver'
            image_tag('silver.png', alt:'silver icon', width: '30', oncontextmenu: 'return false;')
        end
    end

end
