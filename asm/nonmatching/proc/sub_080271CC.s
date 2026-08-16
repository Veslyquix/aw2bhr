	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080271CC
sub_080271CC: @ 0x080271CC
	push {r4, r5, lr}
	adds r4, r0, #0
	lsls r0, r4, #0x18
	lsrs r0, r0, #0x18
	bl sub_080266DC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08027226
	adds r0, r4, #0
	bl sub_08025CF0
	cmp r0, #0
	beq _08027234
	movs r2, #1
	ldr r5, _0802722C @ =gUnknown_08499594
	ldr r1, _08027230 @ =gUnknown_084995FE
	lsls r0, r4, #1
	adds r3, r0, r1
	ldrh r0, [r3]
	adds r0, #1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08027222
	adds r4, r5, #0
_08027208:
	adds r2, #1
	cmp r2, #0x32
	bgt _08027222
	ldrh r0, [r3]
	adds r0, r2, r0
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08027208
_08027222:
	cmp r2, #0x33
	bne _08027234
_08027226:
	movs r0, #0
	b _08027236
	.align 2, 0
_0802722C: .4byte gUnknown_08499594
_08027230: .4byte gUnknown_084995FE
_08027234:
	movs r0, #1
_08027236:
	pop {r4, r5}
	pop {r1}
	bx r1

