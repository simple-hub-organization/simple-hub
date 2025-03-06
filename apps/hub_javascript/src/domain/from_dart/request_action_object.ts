import { EntityProperties } from "./entity_type_utils";
import { ActionValues, EntityActions, VendorsAndServices } from "./request_action_types";

export class RequestActionObject {
    entityIds: Set<string>;
    vendors?: Set<VendorsAndServices>;
    property: EntityProperties;
    actionType: EntityActions;
    value: Map<ActionValues, any>;
    static event: string = 'setEntityState';

    constructor(
        entityIds: Set<string>,
        property: EntityProperties,
        actionType: EntityActions,
        vendors?: Set<VendorsAndServices>,
        value?: Map<ActionValues, any>
    ) {
        this.entityIds = entityIds;
        this.property = property;
        this.actionType = actionType;
        this.vendors = vendors;
        this.value = value ?? new Map<ActionValues, any>();
    }

    // Static method to create an instance from JSON
    static fromJson(json: any): RequestActionObject {
        // const result: string[] = JSON.parse('["6947661118724319617", "2342342"]');
        const ids: string[] = JSON.parse(json.entitiesId);

        return new RequestActionObject(
             new Set<string>(ids),
            json.property as EntityProperties,
            json.actionType as EntityActions,
            json.vendors ? new Set(json.vendors as VendorsAndServices[]) : undefined,
            new Map(Object.entries(json.value).map(([key, val]) => [key as ActionValues, val]))
        );
    }

    toInfrastructure(): RequestActionObjectDtos {
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

export interface RequestActionObjectDtos {
    entitiesId: string[];
    property: string;
    vendors: string[];
    actionType: string;
    value: { [key: string]: any };
}
