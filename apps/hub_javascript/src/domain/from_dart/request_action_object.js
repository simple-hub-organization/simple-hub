import { EntityProperties } from "./entity_type_utils.js";
import { ActionValues, EntityActions, VendorsAndServices } from "./request_action_types.js";

export class RequestActionObject {
    static event = 'setEntityState';

    constructor(
        entityIds,
        property,
        actionType,
        vendors,
        value
    ) {
        this.entityIds = entityIds;
        this.property = property;
        this.actionType = actionType;
        this.vendors = vendors;
        this.value = value ?? new Map();
    }

    // Static method to create an instance from JSON
    static fromJson(json) {
        const ids = JSON.parse(json.entitiesId);
        const valuesMap =  new Map(Object.entries(JSON.parse(json.value)))
        
        return new RequestActionObject(
            new Set(ids),
            json.property,
            json.actionType,
            json.vendors ? new Set(json.vendors) : undefined,
            valuesMap
        );
    }

    toInfrastructure() {
        return {
            entitiesId: Array.from(this.entityIds),
            property: this.property,
            vendors: this.vendors ? Array.from(this.vendors).map(v => v) : [],
            actionType: this.actionType,
            value: Object.fromEntries(
                Array.from(this.value.entries()).map(([key, value]) => [key, value])
            ),
        };
    }
} 