	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_08036E18
sub_08036E18: @ 0x08036E18
	push {lr}
	ldr r0, _08036E48 @ =0x04000130
	ldrh r1, [r0]
	ldr r2, _08036E4C @ =0x000003FF
	adds r0, r2, #0
	bics r0, r1
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0xf
	bne _08036E42
	ldr r1, _08036E50 @ =gUnknown_02028E41
	ldrb r0, [r1]
	cmp r0, #0xaa
	bne _08036E3A
	ldrb r0, [r1, #1]
	cmp r0, #0x55
	beq _08036E3E
_08036E3A:
	bl sub_0804A010
_08036E3E:
	bl sub_08036CB4
_08036E42:
	pop {r0}
	bx r0
	.align 2, 0
_08036E48: .4byte 0x04000130
_08036E4C: .4byte 0x000003FF
_08036E50: .4byte gUnknown_02028E41

