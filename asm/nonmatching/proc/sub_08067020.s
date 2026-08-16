	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08067020
sub_08067020: @ 0x08067020
	push {lr}
	sub sp, #8
	ldr r0, _08067034 @ =gUnknown_0202F200
	ldrb r0, [r0]
	cmp r0, #0
	beq _08067038
	movs r0, #0x66
	bl sub_0803B4DC
	b _0806703E
	.align 2, 0
_08067034: .4byte gUnknown_0202F200
_08067038:
	movs r0, #0x71
	bl sub_0803B4DC
_0806703E:
	movs r0, #2
	rsbs r0, r0, #0
	bl sub_08064B68
	bl sub_08065700
	bl sub_08014878
	ldr r0, _0806706C @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #3
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #3
	movs r2, #0x11
	movs r3, #0x1a
	bl sub_08012BC8
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_0806706C: .4byte gUnknown_08499578

