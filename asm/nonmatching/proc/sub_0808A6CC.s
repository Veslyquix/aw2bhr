	.include "macro.inc"
	.syntax unified

	thumb_func_start sub_0808A6CC
sub_0808A6CC: @ 0x0808A6CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	str r0, [sp]
	movs r0, #9
	bl sub_0803B3D4
	ldr r0, [sp]
	bl sub_0807898C
	ldr r0, _0808A7E4 @ =gUnknown_0822FEF0
	ldr r1, _0808A7E8 @ =gUnknown_0300251C
	ldr r1, [r1]
	lsls r1, r1, #0x1c
	lsrs r1, r1, #0x1e
	lsls r1, r1, #0xe
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	ldr r0, _0808A7EC @ =gUnknown_0822F9AC
	ldr r1, _0808A7F0 @ =gUnknown_08499584
	ldr r1, [r1]
	bl Decompress
	bl sub_08013B1C
	ldr r0, _0808A7F4 @ =gUnknown_0822FE50
	movs r1, #0x20
	movs r2, #0xa0
	bl ApplyPaletteExt
	ldr r0, _0808A7F8 @ =gUnknown_086170D4
	ldr r1, [sp]
	bl Proc_Start
	ldr r0, _0808A7FC @ =gUnknown_0823FFBC
	ldr r4, _0808A800 @ =gUnknown_0200FC50
	adds r1, r4, #0
	bl Decompress
	movs r5, #0
	adds r6, r4, #0
	ldr r4, _0808A804 @ =0x000003FF
_0808A72C:
	lsls r0, r5, #5
	ands r0, r4
	lsls r0, r0, #5
	adds r0, r0, r6
	lsls r1, r5, #3
	ands r1, r4
	lsls r1, r1, #5
	ldr r2, _0808A808 @ =0x06010000
	adds r1, r1, r2
	movs r2, #0x40
	bl CpuFastSet
	adds r5, #1
	cmp r5, #7
	ble _0808A72C
	movs r5, #0
	ldr r4, _0808A804 @ =0x000003FF
	ldr r0, _0808A808 @ =0x06010000
	mov sl, r0
	movs r1, #8
	mov sb, r1
	movs r2, #0x44
	mov r8, r2
	movs r7, #0x28
	movs r6, #0x40
_0808A75E:
	mov r0, sb
	ands r0, r4
	lsls r0, r0, #5
	ldr r1, _0808A800 @ =gUnknown_0200FC50
	adds r0, r0, r1
	adds r1, r6, #0
	ands r1, r4
	lsls r1, r1, #5
	add r1, sl
	movs r2, #0x20
	bl CpuFastSet
	adds r0, r7, #0
	ands r0, r4
	lsls r0, r0, #5
	ldr r2, _0808A800 @ =gUnknown_0200FC50
	adds r0, r0, r2
	mov r1, r8
	ands r1, r4
	lsls r1, r1, #5
	add r1, sl
	movs r2, #0x20
	bl CpuFastSet
	movs r0, #4
	add sb, r0
	movs r1, #8
	add r8, r1
	adds r7, #4
	adds r6, #8
	adds r5, #1
	cmp r5, #7
	ble _0808A75E
	ldr r0, _0808A80C @ =gUnknown_0200FED0
	ldr r1, _0808A810 @ =0x06010B00
	movs r2, #0x20
	bl CpuFastSet
	ldr r0, _0808A814 @ =gUnknown_08240AD4
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0808A818 @ =gUnknown_0861707C
	ldr r1, [sp]
	bl Proc_Start
	movs r0, #0
	bl sub_0801B780
	ldr r0, _0808A81C @ =gUnknown_081320AC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x20
	bl ApplyPaletteExt
	bl sub_08013AEC
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808A7E4: .4byte gUnknown_0822FEF0
_0808A7E8: .4byte gUnknown_0300251C
_0808A7EC: .4byte gUnknown_0822F9AC
_0808A7F0: .4byte gUnknown_08499584
_0808A7F4: .4byte gUnknown_0822FE50
_0808A7F8: .4byte gUnknown_086170D4
_0808A7FC: .4byte gUnknown_0823FFBC
_0808A800: .4byte gUnknown_0200FC50
_0808A804: .4byte 0x000003FF
_0808A808: .4byte 0x06010000
_0808A80C: .4byte gUnknown_0200FED0
_0808A810: .4byte 0x06010B00
_0808A814: .4byte gUnknown_08240AD4
_0808A818: .4byte gUnknown_0861707C
_0808A81C: .4byte gUnknown_081320AC

