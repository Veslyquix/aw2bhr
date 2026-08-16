	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08026A88
sub_08026A88: @ 0x08026A88
	push {r4, lr}
	adds r4, r0, #0
	cmp r4, #1
	bne _08026A96
	b _08026AB2
_08026A92:
	movs r0, #0
	b _08026AB4
_08026A96:
	movs r3, #1
	cmp r3, r4
	bge _08026AB2
	ldr r0, _08026ABC @ =gUnknown_08499598
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x3c
_08026AA4:
	ldrb r0, [r2, #0x1a]
	cmp r0, r1
	beq _08026A92
	adds r2, #0x3c
	adds r3, #1
	cmp r3, r4
	blt _08026AA4
_08026AB2:
	movs r0, #1
_08026AB4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08026ABC: .4byte gUnknown_08499598

