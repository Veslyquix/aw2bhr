	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08029CB8
sub_08029CB8: @ 0x08029CB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r2, #0
	lsls r3, r3, #0x18
	lsrs r6, r3, #0x18
	ldr r0, _08029D00 @ =gUnknown_0849A0A8
	movs r1, #0
	bl sub_080152EC
	adds r3, r0, #0
	str r4, [r3, #0x24]
	ldr r0, _08029D04 @ =gUnknown_030033EC
	ldrh r1, [r0]
	ldr r0, _08029D08 @ =gUnknown_08499598
	ldr r2, [r0]
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r2
	ldr r0, [r0]
	subs r0, r0, r4
	str r0, [r3, #0x28]
	ldrh r0, [r5]
	strh r0, [r3, #0x20]
	ldrh r0, [r5, #2]
	strh r0, [r3, #0x22]
	ldr r0, _08029D0C @ =gUnknown_03003FC0
	adds r0, #0x47
	ldrb r0, [r0]
	cmp r0, #0
	beq _08029D10
	adds r1, r3, #0
	adds r1, #0x30
	movs r0, #0
	strb r0, [r1]
	b _08029D16
	.align 2, 0
_08029D00: .4byte gUnknown_0849A0A8
_08029D04: .4byte gUnknown_030033EC
_08029D08: .4byte gUnknown_08499598
_08029D0C: .4byte gUnknown_03003FC0
_08029D10:
	adds r0, r3, #0
	adds r0, #0x30
	strb r6, [r0]
_08029D16:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

