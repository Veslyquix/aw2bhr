	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808AB8C
sub_0808AB8C: @ 0x0808AB8C
	push {r4, lr}
	ldr r2, _0808ABAC @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _0808ABB0 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	bl sub_0808AAF4
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	ldr r2, _0808ABB4 @ =gUnknown_0848548C
	movs r4, #1
	b _0808ABBA
	.align 2, 0
_0808ABAC: .4byte 0x04000204
_0808ABB0: .4byte 0x0000FFFC
_0808ABB4: .4byte gUnknown_0848548C
_0808ABB8:
	adds r2, #4
_0808ABBA:
	ldr r1, [r2]
	adds r0, r1, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	beq _0808ABCE
	ldrh r0, [r1, #0x28]
	cmp r3, r0
	bne _0808ABB8
	movs r4, #0
_0808ABCE:
	ldr r1, _0808AC08 @ =gUnknown_03005C74
	ldr r0, [r2]
	ldr r0, [r0]
	str r0, [r1]
	ldr r1, _0808AC0C @ =gUnknown_03005C80
	ldr r0, [r2]
	ldr r0, [r0, #4]
	str r0, [r1]
	ldr r1, _0808AC10 @ =gUnknown_03005C84
	ldr r0, [r2]
	ldr r0, [r0, #8]
	str r0, [r1]
	ldr r1, _0808AC14 @ =gUnknown_03005C70
	ldr r0, [r2]
	ldr r0, [r0, #0xc]
	str r0, [r1]
	ldr r1, _0808AC18 @ =gUnknown_03000F68
	ldr r0, [r2]
	ldr r0, [r0, #0x10]
	str r0, [r1]
	ldr r1, _0808AC1C @ =gUnknown_03005C78
	ldr r0, [r2]
	adds r0, #0x14
	str r0, [r1]
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0808AC08: .4byte gUnknown_03005C74
_0808AC0C: .4byte gUnknown_03005C80
_0808AC10: .4byte gUnknown_03005C84
_0808AC14: .4byte gUnknown_03005C70
_0808AC18: .4byte gUnknown_03000F68
_0808AC1C: .4byte gUnknown_03005C78

