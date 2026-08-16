	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080601F0
sub_080601F0: @ 0x080601F0
	push {r4, r5, lr}
	ldr r0, _08060238 @ =gUnknown_08499590
	ldr r3, [r0]
	ldr r0, _0806023C @ =gUnknown_030046C0
	ldrb r2, [r0, #6]
	ldr r0, _08060240 @ =gUnknown_08499594
	ldr r0, [r0]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrb r4, [r1, #3]
	lsls r2, r4, #1
	ldr r5, _08060244 @ =0x0000417A
	adds r0, r3, r5
	adds r0, r0, r2
	ldrh r0, [r0]
	ldrb r1, [r1, #2]
	adds r0, r0, r1
	ldr r2, _08060248 @ =0x0000234A
	adds r3, r3, r2
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, #0
	beq _08060254
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_08029088
	ldr r1, _0806024C @ =gUnknown_030046D4
	movs r0, #0
	str r0, [r1]
	ldr r1, _08060250 @ =gUnknown_030045D4
	movs r0, #7
	b _08060258
	.align 2, 0
_08060238: .4byte gUnknown_08499590
_0806023C: .4byte gUnknown_030046C0
_08060240: .4byte gUnknown_08499594
_08060244: .4byte 0x0000417A
_08060248: .4byte 0x0000234A
_0806024C: .4byte gUnknown_030046D4
_08060250: .4byte gUnknown_030045D4
_08060254:
	ldr r1, _08060260 @ =gUnknown_030045D4
	movs r0, #3
_08060258:
	strh r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08060260: .4byte gUnknown_030045D4

