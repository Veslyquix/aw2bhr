	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A5C4
sub_0808A5C4: @ 0x0808A5C4
	push {lr}
	sub sp, #8
	bl sub_08013C00
	movs r0, #0
	bl sub_0801B780
	ldr r0, _0808A5FC @ =gUnknown_081320AC
	movs r1, #0x60
	movs r2, #0x20
	bl sub_08013618
	ldr r0, _0808A600 @ =gUnknown_03005908
	ldr r1, [r0]
	cmp r1, #0
	bne _0808A60C
	ldr r0, _0808A604 @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r3, _0808A608 @ =0x00000973
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	str r1, [sp, #4]
	movs r0, #0
	movs r1, #0x12
	bl sub_08014A5C
	b _0808A626
	.align 2, 0
_0808A5FC: .4byte gUnknown_081320AC
_0808A600: .4byte gUnknown_03005908
_0808A604: .4byte gUnknown_08499578
_0808A608: .4byte 0x00000973
_0808A60C:
	cmp r1, #1
	bne _0808A626
	ldr r0, _0808A630 @ =gUnknown_08499578
	ldr r2, [r0]
	ldr r3, _0808A634 @ =0x00000974
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r1, #0x12
	bl sub_08014A5C
_0808A626:
	bl sub_08013AEC
	add sp, #8
	pop {r0}
	bx r0
	.align 2, 0
_0808A630: .4byte gUnknown_08499578
_0808A634: .4byte 0x00000974

