	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_080261E8
sub_080261E8: @ 0x080261E8
	push {lr}
	adds r2, r0, #0
	ldr r0, _08026214 @ =gUnknown_03003FC0
	ldrb r0, [r0, #1]
	cmp r0, #1
	bne _0802624A
	ldr r0, _08026218 @ =gUnknown_08499598
	ldr r1, [r0]
	lsls r0, r2, #4
	subs r0, r0, r2
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0x1a]
	subs r0, #1
	cmp r0, #4
	bhi _0802624E
	lsls r0, r0, #2
	ldr r1, _0802621C @ =_08026220
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08026214: .4byte gUnknown_03003FC0
_08026218: .4byte gUnknown_08499598
_0802621C: .4byte _08026220
_08026220: @ jump table
	.4byte _08026234 @ case 0
	.4byte _08026238 @ case 1
	.4byte _0802623C @ case 2
	.4byte _08026240 @ case 3
	.4byte _0802624A @ case 4
_08026234:
	movs r0, #0x65
	b _08026242
_08026238:
	movs r0, #0x66
	b _08026242
_0802623C:
	movs r0, #0x68
	b _08026242
_08026240:
	movs r0, #0x67
_08026242:
	bl sub_0803CBD8
	cmp r0, #0
	beq _0802624E
_0802624A:
	movs r0, #1
	b _08026250
_0802624E:
	movs r0, #0
_08026250:
	pop {r1}
	bx r1

