	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_0801853C
sub_0801853C: @ 0x0801853C
	push {r4, r5, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r0, _08018590 @ =gUnknown_03002514
	ldrb r0, [r0]
	cmp r0, #1
	bne _08018556
	ldr r0, _08018594 @ =gUnknown_03001420
	ldrh r0, [r0]
	ldr r5, _08018598 @ =gUnknown_0808E57C
	lsls r4, r1, #0x10
	cmp r0, #0
	bne _08018572
_08018556:
	ldr r5, _08018598 @ =gUnknown_0808E57C
	ldr r2, [r5]
	lsls r4, r1, #0x10
	asrs r1, r4, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r3, r0, r2
	movs r1, #0
	strh r1, [r3, #0xe]
	adds r2, #8
	adds r0, r0, r2
	ldr r1, _0801859C @ =sub_080184EC
	str r1, [r0]
_08018572:
	ldr r2, [r5]
	asrs r0, r4, #0x10
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r2, #4
	adds r1, r1, r2
	ldr r0, [r1]
	adds r0, #0x10
	str r0, [r1]
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08018590: .4byte gUnknown_03002514
_08018594: .4byte gUnknown_03001420
_08018598: .4byte gUnknown_0808E57C
_0801859C: .4byte sub_080184EC

