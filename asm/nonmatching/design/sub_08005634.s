	.include "macro.inc"
	.syntax unified
    

	thumb_func_start sub_08005634
sub_08005634: @ 0x08005634
	push {r4, lr}
	sub sp, #8
	ldr r1, _08005668 @ =gUnknown_0200B204
	movs r0, #1
	bl sub_0803CCB8
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _08005670
	bl sub_0803CEAC
	ldr r0, _0800566C @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #0xa
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #0xe
	movs r2, #4
	movs r3, #0xf
	bl sub_08012BC8
	bl sub_08013AEC
	b _0800569C
	.align 2, 0
_08005668: .4byte gUnknown_0200B204
_0800566C: .4byte gUnknown_08499578
_08005670:
	bl sub_0803CEAC
	ldr r0, _080056A4 @ =gUnknown_08499578
	ldr r0, [r0]
	movs r1, #0xa
	str r1, [sp]
	movs r4, #0
	str r4, [sp, #4]
	movs r1, #0xe
	movs r2, #4
	movs r3, #0xf
	bl sub_08012BC8
	movs r0, #0xe
	movs r1, #4
	movs r2, #1
	bl sub_0803CDBC
	ldr r0, _080056A8 @ =gUnknown_03001418
	strh r4, [r0]
	ldr r0, _080056AC @ =gUnknown_03001FF8
	strh r4, [r0]
_0800569C:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080056A4: .4byte gUnknown_08499578
_080056A8: .4byte gUnknown_03001418
_080056AC: .4byte gUnknown_03001FF8

