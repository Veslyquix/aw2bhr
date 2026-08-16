	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005F1C
sub_08005F1C: @ 0x08005F1C
	push {r4, lr}
	ldr r4, _08005F48 @ =gUnknown_0200B0B0
	ldr r0, [r4]
	adds r2, r0, #0
	adds r2, #0x6b
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _08005F40
	adds r0, r1, #0
	bl sub_08015328
	ldr r0, [r4]
	adds r0, #0x6b
	movs r1, #0xff
	strb r1, [r0]
_08005F40:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005F48: .4byte gUnknown_0200B0B0

