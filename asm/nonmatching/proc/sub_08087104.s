	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08087104
sub_08087104: @ 0x08087104
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08087140 @ =gUnknown_02027F74
	adds r0, r5, #4
	ldr r1, [r4, #0x58]
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0xb3
	bhi _08087144
	bl sub_0803CA54
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08087144
	ldrb r1, [r5]
	adds r0, r4, #0
	adds r0, #0x64
	strh r1, [r0]
	ldrb r0, [r5, #1]
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	ldrb r1, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x68
	strh r1, [r0]
	ldrb r1, [r5, #3]
	adds r0, #2
	strh r1, [r0]
	b _0808715C
	.align 2, 0
_08087140: .4byte gUnknown_02027F74
_08087144:
	adds r1, r4, #0
	adds r1, #0x64
	ldr r0, _08087164 @ =0x0000FFFF
	strh r0, [r1]
	adds r1, #2
	movs r0, #1
	rsbs r0, r0, #0
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
_0808715C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08087164: .4byte 0x0000FFFF

